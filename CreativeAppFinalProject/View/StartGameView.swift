//
//  StartGameView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct StartGameView: View {
    @State var ExitButtonState = false
    @State var RankButtonState = false
    var body: some View {
        
        VStack{
            Text("踏碩台南")
            HStack(){
                
            }
            .frame(width: 500, height: 500)
            .background(.white)
            
            HStack(){
                Button(action:{
                    ExitButtonState.toggle()
                } ,label: {
                    Text("Exit")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .border(Color.white,width:2)
                })
                Button(action:{
                    RankButtonState.toggle()
                } ,label: {
                    Text("Rank")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .border(Color.white,width:2)
                })
                VStack{
                    Text("目前排名：")
                    
                    Text("目前分數：")
                }
            }
            
            
            
            Divider()
            Spacer()
        }
        .background(Color.teal)
    }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
