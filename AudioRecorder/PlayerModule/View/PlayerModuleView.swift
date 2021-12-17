//
//  PlayerModuleView.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.


// Player View UI Elements 

import UIKit
import AVFoundation

class PlayerModuleView: UIViewController, PlayerModuleViewProtocol {
 
    var viewTitle: String! {
        didSet {
            self.title = viewTitle ?? "Audio Player"
        }
    }
    var presenter: PlayerModulePresenterProtocol?
    var displayErrorMessage: String? {
        didSet {
            errorLabel.text = displayErrorMessage ?? "Something bad happend"
        }
    }
    
    var playButtonImage: String? {
        didSet {
            guard let imageName = playButtonImage else {
                playButtonImage = "circle"
                return
            }
            let configuration = UIImage.SymbolConfiguration(pointSize: 100, weight: .medium)
            playButton.setImage(UIImage(systemName: imageName)?.withConfiguration(configuration), for: .normal)
            playButton.tintColor = AppColors.recordButtonTitle
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
    
    var playButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 250, height: 250))
        let button = UIButton(frame: frame)
        button.layer.cornerRadius = frame.height / 2
        button.backgroundColor = AppColors.recordButtonColor
        button.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayButton()
        view.backgroundColor = AppColors.backgroundColor
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.stopPlaying()
    }
    
    
    func setupPlayButton() {
        view.addSubview(playButton)
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: playButton.frame.width).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: playButton.frame.height).isActive = true
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func playButtonAction() {
        presenter?.playButtonHandler()
    }
}
