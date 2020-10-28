//
//  LineLoginButton.swift
//  Login_SwiftUI
//
//  Created by home on 2020/10/27.
//

import SwiftUI
import LineSDK

struct LineLoginButton: UIViewRepresentable {
    class Coordinator: NSObject, LoginButtonDelegate {
        var parent: LineLoginButton
        
        init(_ parent: LineLoginButton) {
            self.parent = parent
        }
        
        func loginButton(_ button: LoginButton, didSucceedLogin loginResult: LoginResult) {
            print("LINE認証成功")
            print("アクセストークン:\(loginResult.accessToken.value)")
            print("ここでログイン処理を呼び出す")
        }
        
        func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
            print("LINE認証エラー: \(error)")
        }
        
        func loginButtonDidStartLogin(_ button: LoginButton) {
            print("LINE認証開始")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        let loginButton = LoginButton()
        loginButton.delegate = context.coordinator
        
        loginButton.permissions = [.profile]
        loginButton.presentingViewController = nil
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

struct LineLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LineLoginButton()
    }
}
