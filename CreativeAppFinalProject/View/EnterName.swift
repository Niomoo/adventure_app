//
//  EnterName.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct EnterName: View {
    @State var nickName = ""
    @Binding var roomID: String
    var body: some View {
        
        NavigationView{
            VStack(spacing:15){
                Image("Group 3")
                Text("\(roomID)")
                    .foregroundColor(.white)
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                Text("Welcome To \(roomID) Room")
                VStack(alignment: .leading){
                    Text("Enter Your Nick Name:")
                        .fontWeight(.bold)
                    TextField("nickName", text: $nickName, prompt: Text("nickName"))
                        .padding()
                        .frame(width: 300, height:50)
                        .overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.white,lineWidth: 3))
                }
                VStack{
                    NavigationLink(destination:StartGameView(PlayerName:$nickName,Rid: roomID).onAppear {
                        self.joinRoom(roomID: roomID, nickName: nickName)
                    }){
                        Text("Start")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .font(.title)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius:10)
                                .stroke(Color.white,lineWidth: 3))
                    }
                    NavigationLink{
                        JoinRoomView()
                    }label: {
                        Text("Back")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .font(.title)
                            .padding()
                    }
                }
                
                Divider()
                Spacer()
            }
            .background(Color.init(hex:"#69A1AC"))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    func joinRoom(roomID: String, nickName: String){
        let player = NewPlayer(gameID: roomID, name: nickName)
        joinGame(player: player).send { result in
            print()
        }
    }
}

struct EnterName_Previews: PreviewProvider {
    static var previews: some View {
        EnterName(roomID: .constant("12345"))
    }
}
