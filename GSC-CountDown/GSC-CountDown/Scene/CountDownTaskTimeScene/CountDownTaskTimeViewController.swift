//
//  CountDownTaskTimeViewController.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/19.
//

import UIKit
import SnapKit

final class CountDownTaskTimeViewController: UIViewController {
    private lazy var mainTaskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .semibold)
        label.text = "팀원들과 팀플하기 (이)가"
        
        return label
    }()
    
    private lazy var doingTaskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .ultraLight)
        label.text = "진행중입니다!"
        
        return label
    }()
    
    private lazy var decreaseTimerStick: UIView = {
        let timerStick = UIView()
        timerStick.backgroundColor = UIColor(named: "PantoneColor")
        timerStick.layer.cornerRadius = 50
        
        return timerStick
    }()
    
    private lazy var increaseTimerStick: UIView = {
        let timerStick = UIView()
        timerStick.backgroundColor = UIColor(named: "SubPantoneColor")
        timerStick.layer.cornerRadius = 50
        
        return timerStick
    }()
    
    private lazy var hideIncreaseTimerStick: UIView = {
        let hideStick = UIView()
        hideStick.backgroundColor = .white
        
        return hideStick
    }()
    
    private lazy var detailDecreaseTimerStickLine: UIView = {
        let hideStick = UIView()
        hideStick.backgroundColor = .white
        
        return hideStick
    }()
    
    private lazy var detailIncreaseTimerStickLine: UIView = {
        let hideStick = UIView()
        hideStick.backgroundColor = .darkGray
        
        return hideStick
    }()
    
    private lazy var popMainViewSlider: UISlider = {
        let slider = UISlider()
        let sliderThumbImage = sliderThumbImage()
        slider.setThumbImage(sliderThumbImage, for: .normal)
        slider.maximumValue = 1
        slider.minimumValue = 0
        slider.value = 1
        slider.minimumTrackTintColor = UIColor(named: "PantoneColor")
        slider.maximumTrackTintColor = UIColor(named: "PantoneColor")

        return slider
    }()
    
    private func sliderThumbImage() -> UIImage {
        let thumbView = UIView(frame: CGRect(x: 0, y: 0, width: 68, height: 68))
        thumbView.backgroundColor = UIColor.white
        thumbView.layer.cornerRadius = thumbView.frame.height / 2
        
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { context in
            thumbView.layer.render(in: context.cgContext)
        }
    }
    
    private lazy var decreaseTimerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36.0, weight: .medium)
        label.text = "01:00"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var increaseTimerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36.0, weight: .medium)
        label.text = "01:00"
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)

        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(UIColor(named: "PantoneColor"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.addTarget(self, action: #selector(tapPopButton), for: .touchUpInside)

        return button
    }()
    
    @objc func tapPopButton() {
        let viewController = MainPageViewController()
        self.navigationController?.popToRootViewController(animated: true)
    }

    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.setTitleColor(UIColor(named: "PantoneColor"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
        setupNavigationController()
        UILabel().changeTextWeightUltralightFontSize24(label: mainTaskLabel, range: "(이)가")
    }
}

private extension CountDownTaskTimeViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "PantoneColor")
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [cancelButton, toggleButton])
        buttonStackView.spacing = 160.0
        buttonStackView.distribution = .fillEqually
        
        [increaseTimerStick, hideIncreaseTimerStick, mainTaskLabel, doingTaskLabel, decreaseTimerStick, popMainViewSlider, detailDecreaseTimerStickLine, detailIncreaseTimerStickLine, decreaseTimerLabel, increaseTimerLabel, buttonStackView].forEach { view.addSubview($0) }
                
        mainTaskLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60.0)
        }
        
        doingTaskLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(mainTaskLabel.snp.bottom).offset(4.0)
        }
        
        decreaseTimerStick.snp.makeConstraints {
            $0.width.equalTo(300.0)
            $0.height.equalTo(100.0)
            $0.centerX.equalTo(view)
            $0.top.equalTo(doingTaskLabel.snp.bottom).offset(50.0)
        }
        
        increaseTimerStick.snp.makeConstraints {
            $0.width.equalTo(100.0)
            $0.height.equalTo(500.0)
            $0.centerY.equalTo(decreaseTimerStick)
            $0.trailing.equalTo(decreaseTimerStick.snp.trailing).offset(0.0)
        }
        
        hideIncreaseTimerStick.snp.makeConstraints {
            $0.width.equalTo(100.0)
            $0.height.equalTo(250.0)
            $0.centerX.equalTo(increaseTimerStick)
            $0.top.equalTo(increaseTimerStick.snp.top).offset(0.0)
        }
        
        popMainViewSlider.snp.makeConstraints {
            $0.centerX.equalTo(decreaseTimerStick)
            $0.centerY.equalTo(decreaseTimerStick)
            $0.leading.equalTo(decreaseTimerStick.snp.leading).offset(20.0)
            $0.trailing.equalTo(decreaseTimerStick.snp.trailing).offset(-20.0)
        }
        
        decreaseTimerLabel.snp.makeConstraints {
            $0.centerY.equalTo(decreaseTimerStick)
            $0.leading.equalTo(decreaseTimerStick.snp.leading).offset(60.0)
        }
        
        increaseTimerLabel.snp.makeConstraints {
            $0.centerX.equalTo(increaseTimerStick)
            $0.bottom.equalTo(increaseTimerStick.snp.bottom).offset(-80.0)
        }
        
        detailDecreaseTimerStickLine.snp.makeConstraints {
            $0.leading.equalTo(decreaseTimerStick.snp.leading).offset(24.0)
            $0.centerY.equalTo(decreaseTimerStick)
            $0.width.equalTo(0.5)
            $0.height.equalTo(20.0)
        }
        
        detailIncreaseTimerStickLine.snp.makeConstraints {
            $0.bottom.equalTo(increaseTimerStick.snp.bottom).offset(-24.0)
            $0.centerX.equalTo(increaseTimerStick)
            $0.height.equalTo(0.5)
            $0.width.equalTo(20.0)
        }
        
        buttonStackView.snp.makeConstraints {
            UIScreen().screenHeight ? $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(100.0) : $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(60.0)
            $0.centerX.equalTo(view)
        }
    }
}
