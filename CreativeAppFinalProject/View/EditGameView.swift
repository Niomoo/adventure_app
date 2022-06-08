//
//  EditGameView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/7.
//

import SwiftUI

struct EditGameView: View {
    @State private var title = ""
    @State private var description = ""
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                Image("humaaan-12")
                VStack(alignment: .leading){
                    Text("Edit Game")
                        .font(.system(size:24))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                    Text("Title")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                    TextField("title", text: $title, prompt: Text("Ｔ"))
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width: 315, height: 50)
                    Text("Description")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)

                    TextEditor(text: $description)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .frame(width: 315, height: 175)
                }
                
                NavigationLink(destination: EditQuestionView(gameID: 123)) {
                    Text("Ok")
                        .frame(width: 315, height: 50)
                        .font(.system(size:18))
                        .foregroundColor(.white)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                }
                NavigationLink(destination: EditQuestionView(gameID: 123)) {
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

struct EditGameView_Previews: PreviewProvider {
    static var previews: some View {
        EditGameView()
    }
}
