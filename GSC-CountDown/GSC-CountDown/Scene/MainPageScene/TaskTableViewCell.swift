//
//  TaskTableViewCell.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/15.
//

import UIKit
import SnapKit

final class TaskTableViewCell: UITableViewCell {
    private lazy var amountTask: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var descriptionTask: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .lightGray
        
        return label
    }()
    
    func setup() {
        setupLayout()
        
        amountTask.text = "01"
        descriptionTask.text = "갓생 살자 갓생"
    }
}

private extension TaskTableViewCell {
    func setupLayout() {
        [amountTask, descriptionTask].forEach { addSubview($0) }
        
        amountTask.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30.0)
            $0.centerY.equalToSuperview()
        }
        
        descriptionTask.snp.makeConstraints {
            $0.leading.equalTo(amountTask.snp.trailing).offset(100.0)
            $0.centerY.equalTo(amountTask.snp.centerY)
        }
    }
}
