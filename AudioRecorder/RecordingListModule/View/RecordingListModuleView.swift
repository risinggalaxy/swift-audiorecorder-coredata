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
    var presenter: RecordingListModulePresenterProtocol? {
        didSet {
            reloadData()
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecordingCell.self, forCellReuseIdentifier: ReuseableCellIdentifier.recordingCell.rawValue)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        setupTableView()
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    func setupBarButtonItem() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.fill"), style: .plain, target: self, action: #selector(presentRecorderView))
        barButtonItem.tintColor = AppColors.recordButtonColor
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func presentRecorderView() {
        presenter?.presentRecordingView(module: self)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}


extension RecordingListModuleView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = recordings.count > 0 ? false : true
        return recordings.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseableCellIdentifier.recordingCell.rawValue, for: indexPath) as! RecordingCell
        let recording = recordings[indexPath.row]
        cell.configureCell(recording)
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
