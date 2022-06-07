//
//  SignUpFormView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

struct SignUpFormView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var passwordCon = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false


    var body: some View {
        
        NavigationView{
            VStack(spacing:15){
                HStack(spacing:55) {
                    Text("Let's Complete\nThe Form")
                        .font(.system(size:24))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                    Image("Group 3")
                }
                VStack(alignment: .leading){
                    Text("Email")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                    TextField("email", text: $email, prompt: Text("＠"))
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width: 315, height: 50)
                        
                        
                    Text("Password")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                        .padding(.top)
                        
                    SecureField("password", text: $password, prompt: Text("🔒"))
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width: 315, height: 50)
                    Text("Password Confirmation")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                        .padding(.top)
                    
                    SecureField("passwordCon", text: $passwordCon, prompt: Text("🔒"))
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width: 315, height: 50)
                }
                Spacer()
                NavigationLink(destination: SignInView()) {
                    Text("Sign Up")
                        .frame(width: 315, height: 50)
                        .font(.system(size:18))
                        .foregroundColor(.white)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                }
                NavigationLink(destination: SignInView()) {
                    Text("Back")
                        .frame(width: 315, height: 50)
                        .font(.system(size:18))
                        .foregroundColor(.white)
                }
                Divider()
                Spacer()
            }
            .background(Color.init(hex:"#69A1AC"))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
