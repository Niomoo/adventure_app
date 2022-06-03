//
//  SwiftUIView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct LogInView: View {
    @State var buttonState = false
    @State var roomID = ""
    var body: some View {
        VStack{
            Text("")
            Text("文資學堂")
            TextField("roomID", text: $roomID, prompt: Text("roomID"))
                .padding()
                .border(Color.cyan, width: 2)
                
            Button(action:{
                buttonState.toggle()
            } ,label: {
                Text("join")
                    .foregroundColor(.cyan)
                    .frame(width: 300, height: 50)
                    .font(.title)
                    .padding()
                    .border(Color.cyan,width:2)
            })
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
