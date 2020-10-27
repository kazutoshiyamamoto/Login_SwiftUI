//
//  LoginViewModel.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/23.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    
    // TextFieldに入力した文字が半角英数かどうか判別する変数
    @Published var isValidId: Bool = false
    @Published var isValidPassword: Bool = false
    
    @Published var isLoginButtonTapped: Bool = false
    
    private var disposables = [AnyCancellable]()
    
    init() {
        $id
            .sink(receiveValue: {
                self.isValidId = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)
        
        $password
            .sink(receiveValue: {
                self.isValidPassword = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)
        
        $isLoginButtonTapped
            .sink(receiveValue: { isTapped in
                if isTapped == true {
                    print("ここでログイン処理を呼び出す")
                }
            })
            .store(in: &disposables)
    }
}
