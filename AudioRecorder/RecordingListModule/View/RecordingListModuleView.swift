//
//  ViewController.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit

class RecordingListModuleView: UIViewController, RecordingListModuleViewProtocol {
    
    var viewTitle: String! = "Recordings"
    var recordings: [Recording]! = []
    var presenter: RecordingListModulePresenterProtocol?
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecordingCell.self, forCellReuseIdentifier: ReuseableCellIdentifier.recordingCell.rawValue)
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
        presenter?.presentRecordingView(module: self)
    }
    
    func reloadData( with recordings: [Recording] ) {
        self.recordings = recordings
        tableView.reloadData()
    }
    
}

extension RecordingListModuleView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableViewIsEmpty = recordings.count > 0 ? false : true
        tableView.isHidden = tableViewIsEmpty
        addFirstRecordingButton.isHidden = !tableViewIsEmpty
        return recordings.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseableCellIdentifier.recordingCell.rawValue, for: indexPath) as! RecordingCell
        let recording = recordings[indexPath.row]
        cell.configureCell(recording, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //TODO: Add Delete Action
        return nil
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //TODO: Add Edit Action
        return nil
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
}
