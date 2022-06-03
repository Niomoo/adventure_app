//
//  JoinRoomView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct JoinRoomView: View {
    @State var buttonState = false
    @State var roomID = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Let's Join Us")
                    .fontWeight(.bold)
                    .padding()
                    .offset(y:150)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("歡迎來到誰是探險王！")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .offset(y:155)
                TextField("roomID", text: $roomID, prompt: Text("roomID"))
                    .frame(width: 300, height: 20)
                    .padding()
                    .border(Color.white, width: 2)
                    .offset(y:165)
                
                NavigationLink{
                    EnterName()
                }label: {
                    Text("join")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 20)
                        .font(.title)
                        .padding()
                        .border(Color.white,width:2)
                }
                .offset(y:185)
                Divider()
                Spacer()
            }
            .background(Color.teal)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct JoinRoomView_Previews: PreviewProvider {
    static var previews: some View {
        JoinRoomView()
    }
}
