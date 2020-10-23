//
//  LoginViewModel.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var isValidText: Bool = false
    
}
