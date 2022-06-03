//
//  EnterName.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct EnterName: View {
    @State var nickName = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Welcome To xx Room")
                
                Text("Enter Your Nick Name:")
                    .fontWeight(.bold)
                    .offset(x:-58,y:155)
                
                TextField("nickName", text: $nickName, prompt: Text("nickName"))
                    .padding()
                    .frame(width: 300, height:50)
                    .border(Color.white, width: 2)
                    .offset(y:155)
                NavigationLink{
                    StartGameView()
                }label: {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .font(.title)
                        .padding()
                        .border(Color.white,width:2)
                }
                .offset(y:165)
                Divider()
                Spacer()
            }
            .background(Color.teal)
            .navigationBarHidden(true)
        }
        
        
    }
}

struct EnterName_Previews: PreviewProvider {
    static var previews: some View {
        EnterName()
    }
}
