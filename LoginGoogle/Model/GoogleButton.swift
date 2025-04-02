//
//  GoogleButton.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
import GoogleSignIn

//Paso 1.11, creamos el botón
struct GoogleButton: UIViewRepresentable {
    //para elegir el modo oscuro
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }
    
}
