//
//  JoinRoomView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct JoinRoomView: View {
    @State var buttonState = false
    @State var rID = ""
    var body: some View {
        
        NavigationView{
            VStack(spacing:15){
                NavigationLink(destination: SignInView()) {
                    Text("導覽員登入")
                }
                .padding()
                .foregroundColor(.white)
                .frame(width:315, alignment: .trailing)
                Image("Group 3")
                Text("Let's Join Us")
                    .fontWeight(.bold)
                    .padding()
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("歡迎來到誰是探險王！")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .leading){
                    Text("RoomNumber")
                        .font(.headline)
                        .foregroundColor(.white)
                    TextField("roomID", text: $rID, prompt: Text("roomID"))
                        .frame(width: 300, height: 20)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.white,lineWidth: 3))
                        .foregroundColor(.black)
                }
                
                NavigationLink(destination: EnterName(roomID: $rID)){
                    Text("join")
                        .foregroundColor(.white)
                        .background(.clear)
                        .frame(width: 300, height: 20)
                        .font(.title)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.white,lineWidth: 3))
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

struct JoinRoomView_Previews: PreviewProvider {
    static var previews: some View {
        JoinRoomView()
    }
}
