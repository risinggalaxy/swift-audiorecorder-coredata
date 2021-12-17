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
        let frame = CGRect(origin: .zero, size: CGSize(width: .zero, height: 50))
        let label = UILabel(frame: frame)
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
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
    
    public func configureCell( _ recording: Recording, _ indexPath: IndexPath ) {
        recordingTitleLabel.text = recording.title
        contentView.backgroundColor = (indexPath.row % 2 ) == .zero ? AppColors.unEvenCellColor : AppColors.evenCellColor
    }
    
    private func setupRecordingTitleLabelConstraints() {
        recordingTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        recordingTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 15).isActive = true
        recordingTitleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        recordingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
