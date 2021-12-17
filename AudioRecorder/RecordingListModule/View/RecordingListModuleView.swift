//
//  ViewController.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit

class RecordingListModuleView: UIViewController, RecordingListModuleViewProtocol {
    
    var currentSelectedIndexPath: IndexPath?
    
    var displayErrorMessage: String? {
        didSet {
            errorLabel.isHidden = false
            errorLabel.text = displayErrorMessage
        }
    }
    
    private let errorLabel: UILabel = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 500))
        let label = UILabel(frame: frame)
        label.textAlignment = .center
        label.textColor = AppColors.titleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.isHidden = true
        label.numberOfLines = .zero
        return label
    }()
    
    var viewTitle: String! = "Recordings"
    var recordings: [Recording]! = []
    var presenter: RecordingListModulePresenterProtocol?
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.contentInset = UIEdgeInsets(top: 20, left: .zero, bottom: 20, right: .zero)
        tableView.register(RecordingCell.self, forCellReuseIdentifier: ReuseableCellIdentifier.recordingCell.rawValue)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let addFirstRecordingButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        let button = UIButton(frame: frame)
        button.layer.cornerRadius = frame.height / 2
        button.backgroundColor = AppColors.recordButtonColor
        button.addTarget(self, action: #selector(presentRecorderView), for: .touchUpInside)
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .medium)
        let image = UIImage(systemName: "plus")?.withConfiguration(configuration)
        button.tintColor = AppColors.recordButtonTitle
        button.setImage(image, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        setupTableView()
        setupAddFirstRecordingButton()
        setupErrorLabel()
        view.backgroundColor = AppColors.backgroundColor
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    fileprivate func setupAddFirstRecordingButton() {
        view.addSubview(addFirstRecordingButton)
        addFirstRecordingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addFirstRecordingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addFirstRecordingButton.widthAnchor.constraint(equalToConstant: addFirstRecordingButton.frame.width).isActive = true
        addFirstRecordingButton.heightAnchor.constraint(equalToConstant: addFirstRecordingButton.frame.height).isActive = true
        addFirstRecordingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupBarButtonItem() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.fill"), style: .plain, target: self, action: #selector(presentRecorderView))
        barButtonItem.tintColor = AppColors.recordButtonColor
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func presentRecorderView() {
        presenter?.presentRecorderModule(on: self)
    }
    
    fileprivate func setupErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        errorLabel.widthAnchor.constraint(equalToConstant: errorLabel.frame.width).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: errorLabel.frame.height).isActive = true
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func reloadData( with recordings: [Recording] ) {
        self.recordings = recordings
        self.tableView.reloadData()
    }
    
    func append(_ recording: Recording) {
        self.recordings.insert(recording, at: 0)
        self.tableView.reloadData()
    }
    
}

extension RecordingListModuleView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableViewIsEmpty = recordings.count > 0 ? false : true
        tableView.isHidden = tableViewIsEmpty
        addFirstRecordingButton.isHidden = !tableViewIsEmpty || displayErrorMessage != nil
        return recordings.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelectedIndexPath = indexPath
        presentPlayerViewController(with: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseableCellIdentifier.recordingCell.rawValue, for: indexPath) as! RecordingCell
        let recording = recordings[indexPath.row]
        cell.configureCell(recording, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = swipeAction(title: "Edit", imageName: "scissors.badge.ellipsis", with: .normal, and: AppColors.editAction ?? .blue, for: indexPath) {
            [weak self] in
            self?.swipeActionEditRecording(at: indexPath)
        }
        let editAction = UISwipeActionsConfiguration(actions: [action])
        return editAction
    }
    

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = swipeAction(title: "Remove", imageName: "bin.xmark", with: .destructive, and: AppColors.deleteAction ?? .red, for: indexPath) {
            [weak self] in
            self?.swipeActionRemoveRecording(at: indexPath)
        }
        let deleteAction = UISwipeActionsConfiguration(actions: [action])
        return deleteAction
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    internal func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func presentPlayerViewController( with indexPath: IndexPath) {
        presenter?.hostView = self
        presenter?.selectedIndexPath = indexPath
    }
     
    func removeRecording(at indexPath: IndexPath, completion: (() -> Void)) {
        currentSelectedIndexPath = indexPath
        completion()
    }
    
    func swipeAction(title: String, imageName: String, with style: UIContextualAction.Style, and backgroundColor: UIColor, for indexPath: IndexPath, actionHandler: @escaping (() -> Void)) -> UIContextualAction {
        let action = UIContextualAction(style: style, title: title) { _, _, _ in
            actionHandler()
        }
        action.backgroundColor = backgroundColor
        action.image = UIImage(systemName: imageName)
        
        return action
    }
    
    func presentAlertController( _ recordingName: String, with recording: Recording, from indexPath: IndexPath ) {
        currentSelectedIndexPath = indexPath
        let message: String = "You are about to change recordings title"
        let title: String = "Editing"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.text = recordingName
            textField.textAlignment = .left
        }
        let alertAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
            guard let strongSelf = self else { return }
            //TODO:
            guard let newTitle = alertController.textFields?.first?.text else {
                strongSelf.displayErrorMessage = "Unable to find and textfields"
                return
            }
            let adjustedRecording = recording
            if !newTitle.isEmpty && newTitle != recordingName {
                adjustedRecording.title = newTitle
                strongSelf.presenter?.update()
                strongSelf.recordings.remove(at: indexPath.row)
                strongSelf.recordings.insert(adjustedRecording, at: indexPath.row)
                strongSelf.tableView.reloadData()
            }
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func swipeActionRemoveRecording( at indexPath: IndexPath ) {
        removeRecording(at: indexPath, completion: {
            let recording = recordings[indexPath.row]
            tableView.performBatchUpdates {
                presenter?.askInteractorToDelete(recording)
                recordings.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
            } completion: { [weak self] success in
                if success {
                    self?.tableView.reloadData()
                }
            }
            
        })
    }
    
    func swipeActionEditRecording(at indexPath: IndexPath ) {
        let recording = recordings[indexPath.row]
        guard let recordingTitle = recording.title else {
            displayErrorMessage = "Unable to find recording's title"
            return
        }
        presentAlertController(recordingTitle, with: recording, from: indexPath)
    }
}
