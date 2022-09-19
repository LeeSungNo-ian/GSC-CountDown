//
//  MeasureTaskViewController.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/19.
//

import UIKit
import SnapKit

final class MeasureTaskViewController: UIViewController {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.text = "\(Date().monthAndDay) \(Date().dayOfTheWeek) 오늘은"
        
        return label
    }()
    
    private lazy var taskQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.text = "능률의 극대화를 위해 몇분안에 해치울까요?"
        
        return label
    }()
        
    private lazy var countDownPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .countDownTimer

        return picker
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
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupNavigationController()
        changeTextWeightSpecificRange(label: taskQuestionLabel, range: "능률의 극대화")
    }
}

private extension MeasureTaskViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "PantoneColor")
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupLayout() {
        [dateLabel, taskQuestionLabel, countDownPicker, separator, nextPageButton].forEach { view.addSubview($0) }
        
        let leadingTrailingInset: CGFloat = 32.0

        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(leadingTrailingInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(48)
        }
        
        taskQuestionLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(4.0)
        }
        
        countDownPicker.snp.makeConstraints {
            $0.leading.equalTo(taskQuestionLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(taskQuestionLabel.snp.bottom).offset(24.0)
        }
        
        separator.snp.makeConstraints {
            $0.leading.equalTo(countDownPicker)
            $0.trailing.equalToSuperview().offset(-leadingTrailingInset)
            $0.top.equalTo(countDownPicker.snp.bottom).offset(18.0)
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
