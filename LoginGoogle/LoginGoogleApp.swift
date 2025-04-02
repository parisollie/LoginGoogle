//
//  LoginGoogleApp.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
import Firebase


@main
struct LoginGoogleApp: App {
    
    //Paso 1.6
    @StateObject var viewModel = AuthViewModel()
    
    //Paso 1.8
    init(){
        //para que se inice al momento de arrancar
        setupAuth()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Paso 1.7
                .environmentObject(viewModel)
        }
    }
}

//V-300,paso 1.5 extension para firebase
extension LoginGoogleApp {
    private func setupAuth(){
        FirebaseApp.configure()
    }
}
