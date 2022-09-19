//
//  InputTaskViewController.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/17.
//

import UIKit
import SnapKit

final class InputTaskViewController: UIViewController {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.text = "\(Date().monthAndDay) \(Date().dayOfTheWeek) 오늘은"
        
        return label
    }()
    
    private lazy var taskQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.text = "갓생을 향해 무엇을 하실건가요?"
        
        return label
    }()
    
    private lazy var taskTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "오늘 할 일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)])

        return textField
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .separator
        
        return separator
    }()
    
    private lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor(named: "PantoneColor") ,for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        button.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)

        return button
    }()
    
    @objc func tapPushButton() {
        let viewController = MeasureTaskTimeViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupNavigationController()
        changeTextWeightSpecificRange(label: taskQuestionLabel, range: "갓생")
    }
}

private extension InputTaskViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "PantoneColor")
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupLayout() {
        [dateLabel, taskQuestionLabel, taskTextField, separator, nextPageButton].forEach { view.addSubview($0) }
        
        let leadingTrailingInset: CGFloat = 32.0

        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(leadingTrailingInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(48.0)
        }
        
        taskQuestionLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(4.0)
        }
        
        taskTextField.snp.makeConstraints {
            $0.leading.equalTo(taskQuestionLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(taskQuestionLabel.snp.bottom).offset(24.0)
        }
        
        separator.snp.makeConstraints {
            $0.leading.equalTo(taskTextField)
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(taskTextField.snp.bottom).offset(18.0)
            $0.height.equalTo(0.5)
        }
        
        nextPageButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(separator.snp.bottom).offset(32.0)
        }
    }
    
    func changeTextWeightSpecificRange(label: UILabel, range: String) {
        guard let text = label.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: range))
        label.attributedText = attributeString
    }
}
