//
//  Date.swift
//  GSC-CountDown
//
//  Created by 이성노 on 2022/09/15.
//

import Foundation

extension Date {
    var monthAndDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일"
        
        return dateFormatter.string(from: self)
    }
    
    var dayOfTheWeek: String { // 한국말 요일 리턴
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        dateFormatter.dateFormat = "E요일"
        return dateFormatter.string(from: self)
    }
}
