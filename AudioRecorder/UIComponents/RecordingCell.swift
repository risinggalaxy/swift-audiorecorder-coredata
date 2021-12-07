//
//  RecordingCell.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 07/12/2021.
//

import UIKit
import CoreData

class RecordingCell: UITableViewCell {

    var recordingTitleLabel: UILabel = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 50))
        let label = UILabel(frame: frame)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = AppColors.titleColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ReuseableCellIdentifier.recordingCell.rawValue)
        self.contentView.addSubview(recordingTitleLabel)
        setupRecordingTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configureCell( _ recording: Recording ) {
        recordingTitleLabel.text = recording.title
    }
    
    private func setupRecordingTitleLabelConstraints() {
        recordingTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        recordingTitleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        recordingTitleLabel.widthAnchor.constraint(equalToConstant: recordingTitleLabel.frame.width).isActive = true
        recordingTitleLabel.heightAnchor.constraint(equalToConstant: recordingTitleLabel.frame.height).isActive = true
        recordingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
