//
//  NewQuestionView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/7.
//

import SwiftUI

struct NewQuestionView: View {
    @State var account: String
    @State var gameID: Int32
    @State var question = ""
    @State var choice1 = ""
    @State var choice2 = ""
    @State var choice3 = ""
    @State var answer1 = false
    @State var answer2 = false
    @State var answer3 = false
    @State var feedback1 = ""
    @State var feedback2 = ""
    @State var score = ""
    @State var location = ""

    var body: some View {
        NavigationView{
            ScrollView(){
                VStack(alignment: .leading){
                    Text("踏溯高雄")
                        .font(.system(size:24))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                    Text("Question")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                    TextField("question", text: $question, prompt: Text("Ｑ"))
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width: 315, height: 50)
                    Text("Choice")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .padding(.top)
                        .frame(width:315, alignment: .leading)
                    ZStack {
                        TextField("choice1", text: $choice1, prompt: Text("Ａ"))
                            .padding()
                            .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                            .cornerRadius(8)
                            .frame(width: 315, height: 50, alignment: .leading)
                        Toggle(isOn: $answer1) {
                        }
                        .frame(width: 315, height: 50, alignment: .leading)
                    }
                    .padding(.bottom)
                    ZStack {
                        TextField("choice2", text: $choice2, prompt: Text("Ｂ"))
                            .padding()
                            .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                            .cornerRadius(8)
                            .frame(width: 315, height: 50, alignment: .leading)
                        Toggle(isOn: $answer2) {
                        }
                        .frame(width: 315, height: 50, alignment: .leading)
                    }
                    .padding(.bottom)
                    ZStack {
                        TextField("choice3", text: $choice3, prompt: Text("Ｃ"))
                            .padding()
                            .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                            .cornerRadius(8)
                            .frame(width: 315, height: 50, alignment: .leading)
                        Toggle(isOn: $answer3) {
                        }
                        .frame(width: 315, height: 50, alignment: .leading)
                    }
                    .padding(.bottom)
                    
                }
                Text("Feedback")
                    .font(Font.system(size:14))
                    .foregroundColor(.white)
                    .frame(width:315, alignment: .leading)
                TextField("feedback1", text: $feedback1, prompt: Text("✓"))
                    .padding()
                    .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    .frame(width: 315, height: 50)
                TextField("feedback2", text: $feedback2, prompt: Text("✕"))
                    .padding()
                    .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    .frame(width: 315, height: 50)
                Text("Location")
                    .padding(.top)
                    .font(Font.system(size:14))
                    .foregroundColor(.white)
                    .frame(width:315, alignment: .leading)
                TextField("location", text: $location, prompt: Text("☆"))
                    .padding()
                    .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    .frame(width: 315, height: 50)
                Text("Score")
                    .padding(.top)
                    .font(Font.system(size:14))
                    .foregroundColor(.white)
                    .frame(width:315, alignment: .leading)
                TextField("score", text: $score, prompt: Text("☆"))
                    .padding()
                    .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    .frame(width: 315, height: 50)
                NavigationLink(destination: EditQuestionView(account:account, gameID: gameID)) {
                    Text("Create")
                        .frame(width: 315, height: 50)
                        .font(.system(size:18))
                        .foregroundColor(.white)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                }
                Divider()
            }
            .background(Color.init(hex:"#69A1AC"))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NewQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NewQuestionView(account: "abc", gameID: 123)
    }
}
