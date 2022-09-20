//
//  UILabel.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/21.
//

import UIKit

extension UILabel {
    func changeTextWeightUltralightFontSize34(label: UILabel, range: String) -> UILabel {
        guard let text = label.text else { return UILabel() }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 34.0, weight: .ultraLight)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: range))
        label.attributedText = attributeString
        
        return label
    }
    
    func changeTextWeightSemiboldFontSize16(label: UILabel, range: String) -> UILabel {
        guard let text = label.text else { return UILabel() }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: range))
        label.attributedText = attributeString
        
        return label
    }
    
    func changeTextWeightUltralightFontSize24(label: UILabel, range: String) -> UILabel {
        guard let text = label.text else { return UILabel() }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 24.0, weight: .ultraLight)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: range))
        label.attributedText = attributeString
        
        return label
    }
}
