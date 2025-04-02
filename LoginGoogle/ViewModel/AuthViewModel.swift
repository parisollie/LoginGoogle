//
//  AuthViewModel.swift
//  LoginGoogle
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import Foundation
import Firebase
import GoogleSignIn
import SwiftUI

//V-298,Paso 1.0 creamos el authViewModel
class AuthViewModel : ObservableObject {
    //Paso 1.1,Para cambiar a la vista de home y a la de login
    @Published var loginState = false
 
    //V-299,paso 1.4
    func signIn(){
        //si ya existe un registro
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            // si ya existe un registro
            //.restorePreviousSignIn() , restaura la sesion con la que iniciamos
            GIDSignIn.sharedInstance.restorePreviousSignIn() { [unowned self] user, error in
                authUser(user: user, error: error)
            }
        }else{
 
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                    
            //creamos una configuracion
            let config = GIDConfiguration(clientID: clientID)
                    
            GIDSignIn.sharedInstance.configuration = config
            //Abre una nueva ventana para registrarnos en otro lado
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            //cuando ya nos estamos registrando
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                self.authUser(user: signInResult?.user, error: error)
              }
        }
    }
    //Paso 1.3
    func authUser(user: GIDGoogleUser?, error: Error?){
        if let error = error {
            print("Error al iniciar sesion: ",error.localizedDescription)
            return
        }
 
        //lo demas ya no sirve
        guard let idToken = user?.idToken else { return }
        
        let accessToken = user!.accessToken
        //aquí le decimos que se usara el google
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            if let error = error {
                print("Error al iniciar sesion: ",error.localizedDescription)
            }else {
                self.loginState = true
            }
        }
        
    }
    
    //Paso 1.2, función para salir
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        do{
            try Auth.auth().signOut()
            loginState = false
        }catch {
            print(error.localizedDescription)
        }
    }
    
    
}
