//
//  RecorderModuleView.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit

class RecorderModuleView: UIViewController, RecorderModuleViewProtocol {
    
    var viewTitle: String! = "Audio Recorder"
    var statusTitle: String! = "Recording"
    var presenter: RecorderModulePresenterProtocol?
    
    private var buttonWasTapped: Bool = false
    
    let statusLabel: UILabel = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 220, height: 50))
        let label = UILabel(frame: frame)
        label.textColor = AppColors.titleColor
        label.font = UIFont.systemFont(ofSize: 25, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    let recordButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 220, height: 220))
        let button = UIButton(frame: frame)
        let configuration = UIImage.SymbolConfiguration(pointSize: 220, weight: UIImage.SymbolWeight.medium)
        let image = UIImage(systemName: "circle.fill")?.withConfiguration(configuration)
        button.setImage(image, for: .normal)
        button.tintColor = AppColors.recordButtonColor
        button.addTarget(self, action: #selector(stopRecordButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = AppColors.backgroundColor
        setupRecordButton()
        setupStatusLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startRecording()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        recordingPulseAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if !buttonWasTapped {
            stopRecording()
        }
    }
    
    fileprivate func setupStatusLabel() {
        statusLabel.text = statusTitle
        view.addSubview(statusLabel)
        statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: recordButton.topAnchor, constant: -20).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: statusLabel.frame.width).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: statusLabel.frame.height).isActive = true
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupRecordButton() {
        view.addSubview(recordButton)
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func recordingPulseAnimation() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
        let pulseView = UIView(frame: frame)
        pulseView.backgroundColor = AppColors.recordButtonColor
        pulseView.layer.cornerRadius = frame.height / 2
        view.insertSubview(pulseView, at: .zero)
        pulseView.centerXAnchor.constraint(equalTo: recordButton.centerXAnchor).isActive = true
        pulseView.centerYAnchor.constraint(equalTo: recordButton.centerYAnchor).isActive = true
        pulseView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        pulseView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        pulseView.translatesAutoresizingMaskIntoConstraints = false
        UIView.animate(withDuration: 3.5, delay: .zero, options: [.repeat, .curveEaseInOut], animations: {
            pulseView.transform = CGAffineTransform(scaleX: 25, y: 25)
            pulseView.alpha = .zero
        }, completion: nil)
        
    }
    
    @objc func stopRecordButtonWasTapped() {
        buttonWasTapped = true
        self.dismiss(animated: true) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.stopRecording()
        }
    }
    
    func startRecording() {
        presenter?.startRecording()
    }
    
    func stopRecording() {
        presenter?.stopRecording()
    }
    
}
