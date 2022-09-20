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
        label.text = "\(Date().monthAndDay) 오늘은"
        
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
        label.font = .systemFont(ofSize: 34.0, weight: .semibold)
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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.alwaysBounceVertical = false
        tableView.allowsSelection = false
        
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
        
        return tableView
    }()
    
    private lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white ,for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        button.backgroundColor = UIColor(named: "PantoneColor")
        button.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tapPushButton() {
        let viewController = InputTaskViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
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
        UILabel().changeTextWeightUltralightFontSize34(label: taskCountLabel, range: "개...")
        UILabel().changeTextWeightUltralightFontSize34(label: sloganLabel, range: "을 향해 서둘러!")
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell
        
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}

private extension MainPageViewController {
    func setupLayout() {
        [dateLabel, highlightUnderline, taskCountLabel, sloganLabel, separator, taskTableView, nextPageButton, nextPageButtonLabel].forEach { view.addSubview($0) }
        
        let leadingTrailingInset: CGFloat = 24.0
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(leadingTrailingInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(leadingTrailingInset)
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
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(sloganLabel.snp.bottom).offset(18.0)
            $0.height.equalTo(0.5)
        }
        
        taskTableView.snp.makeConstraints {
            $0.leading.equalTo(separator)
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(separator.snp.bottom).offset(18.0)
            $0.height.equalTo(200)
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
}
