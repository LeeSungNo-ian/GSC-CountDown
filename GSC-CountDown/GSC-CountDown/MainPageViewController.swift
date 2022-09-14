//
//  MainPageViewController.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/14.
//

import UIKit
import SnapKit

final class MainPageViewController: UIViewController {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.text = "9월 16일 오늘은"

        return label
    }()
    
    private lazy var taskCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 38.0, weight: .semibold)
        label.text = "0개..."

        return label
    }()
    
    private lazy var highlightUnderline: UIView = {
        let underline = UIView()
        underline.backgroundColor = UIColor(named: "PantoneColor")
        
        return underline
    }()
    
    private lazy var sloganLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34.0, weight: .ultraLight)
        label.text = "갓생을 향해 서둘러!"
        
        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .separator

        return separator
    }()
    
    private lazy var taskTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 30.0
        
        return tableView
    }()
    
    private lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white ,for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        button.backgroundColor = UIColor(named: "PantoneColor")

        return button
    }()
    
    private lazy var nextPageButtonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.text = "갓생 살아보기"
        label.textColor = .white

        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "MainBackgroundColor")
        setupLayout()
        changeTextWeight(label: taskCountLabel)
        changeTextWeight(label: sloganLabel)
    }
}

private extension MainPageViewController {
    func setupLayout() {
        [dateLabel, highlightUnderline, taskCountLabel, sloganLabel, separator, taskTableView, nextPageButton, nextPageButtonLabel].forEach { view.addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30.0)
        }

        taskCountLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(6.0)
        }
        
        highlightUnderline.snp.makeConstraints {
            $0.leading.equalTo(taskCountLabel.snp.leading)
            $0.trailing.equalTo(taskCountLabel.snp.trailing)
            $0.height.equalTo(12.0)
            $0.bottom.equalTo(taskCountLabel.snp.bottom).offset(-2.0)
        }
        
        sloganLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(taskCountLabel.snp.bottom).offset(6.0)
        }
        
        separator.snp.makeConstraints {
            $0.leading.equalTo(sloganLabel)
            $0.trailing.equalToSuperview().offset(-30.0)
            $0.top.equalTo(sloganLabel.snp.bottom).offset(18.0)
            $0.height.equalTo(0.5)
        }
        
        taskTableView.snp.makeConstraints {
            $0.leading.equalTo(separator)
            $0.trailing.equalToSuperview().offset(-30.0)
            $0.top.equalTo(separator.snp.bottom).offset(18.0)
            $0.bottom.equalToSuperview().offset(-300.0)
        }
        
        nextPageButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        nextPageButtonLabel.snp.makeConstraints {
            $0.centerX.equalTo(nextPageButton.snp.centerX)
            $0.top.equalTo(nextPageButton.snp.top).offset(28.0)
        }
    }
    
    func changeTextWeight(label: UILabel) {
        if label == taskCountLabel {
            guard let text = label.text else { return }
            let attributeString = NSMutableAttributedString(string: text)
            let font = UIFont.systemFont(ofSize: 34.0, weight: .ultraLight)
            attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "개..."))
            taskCountLabel.attributedText = attributeString
        }
        else {
            guard let text = label.text else { return }
            let attributeString = NSMutableAttributedString(string: text)
            let font = UIFont.systemFont(ofSize: 34.0, weight: .semibold)
            attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "갓생"))
            sloganLabel.attributedText = attributeString
        }
    }
}
