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

class AuthViewModel : ObservableObject {
    //Para cambiar a la vista de home y a la de login
    @Published var loginState = false
 
    
    //Vid 299
    func signIn(){
        //Vid 298, si existe un registro
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            // si ya existe un registro
            //.restorePreviousSignIn() , restaura la sesion con la que iniciamos
            GIDSignIn.sharedInstance.restorePreviousSignIn() { [unowned self] user, error in
                authUser(user: user, error: error)
            }
        }else{
 
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                    
            //Vid 299,creamos una configuracion
            let config = GIDConfiguration(clientID: clientID)
                    
            GIDSignIn.sharedInstance.configuration = config
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            //Vid 299,cuando ya nos estamos registrando 
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                self.authUser(user: signInResult?.user, error: error)
              }
            
        }
        
        
    }
    //Vid 298,
    func authUser(user: GIDGoogleUser?, error: Error?){
        if let error = error {
            print("Error al iniciar sesion: ",error.localizedDescription)
            return
        }
 
        //Vid 298, lo demas ya no sirve
        guard let idToken = user?.idToken else { return }
        let accessToken = user!.accessToken
        //Vid 298, le decimos que se usara el google
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            if let error = error {
                print("Error al iniciar sesion: ",error.localizedDescription)
            }else {
                self.loginState = true
            }
        }
        
    }
    //Vid 298 , funcion para salir
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
