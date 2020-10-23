//
//  String+Extensions.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/23.
//

extension String {
    // 半角英数かどうか判別
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
