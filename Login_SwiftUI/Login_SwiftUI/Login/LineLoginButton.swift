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
             print("Login Succeeded.")
         }
         
         func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
             print("Error: \(error)")
         }
         
         func loginButtonDidStartLogin(_ button: LoginButton) {
             print("Login Started.")
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
