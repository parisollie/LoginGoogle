//
//  LoginGoogleApp.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

//Vid 300
import SwiftUI
import Firebase
@main
struct LoginGoogleApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        //Vid 300, para que se inice al momento de arrancar 
        setupAuth()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

//Vid 300, extension para firebase
extension LoginGoogleApp {
    private func setupAuth(){
        FirebaseApp.configure()
    }
}
