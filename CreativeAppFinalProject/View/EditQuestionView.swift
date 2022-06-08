//
//  EditQuestionView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

struct EditQuestionView: View {
    @State var title = "踏溯高雄"
    @State var gameID: Int32
    @State var description = "臺灣南方最繁華的國際城市——高雄市，為2009年世界運動會主辦城市，因受海洋氣候調節，全年陽光普照、氣候宜人，有獨特的「海洋首都」特性。近年來大力推展觀光事業，已成為全臺最美麗的城市之一。"
    @State var state = false
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                    Text(title)
                        .font(.system(size:28))
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                        .frame(width:315, alignment: .leading)

                Text("# \(gameID)")
                    .frame(width:315, alignment: .leading)
                    .padding(.bottom)
                Text(description)
                    .frame(width:315, alignment: .leading)
                    .padding(.bottom)
                HStack {
                    Text(state ?"遊戲已開始":"遊戲未開始")
                        .font(.system(size:18))
                    Toggle(isOn: $state) {
                    }
                }
                .frame(width:200, alignment: .leading)
                Text("問題列表")
                    .underline(color: Color.init(hex:"#69A1AC"))
                    .frame(width:315, alignment: .leading)
                List(allQuestions) { element in
                    NavigationLink(destination: UpdateQuestionView()) {
                        Text("\(element.question)")
                    }
                }
                HStack(spacing:50) {
                    NavigationLink(destination: DashboardView()) {
                        Text("←")
                    }
                    .font(.system(size:42))
                    .foregroundColor(Color.white)
                    .background(
                        Circle()
                            .fill(Color.black)
                            .frame(width: 55, height: 55)
                    )
                    .frame(width:115, alignment: .leading)
                    NavigationLink(destination: NewQuestionView()) {
                        Text("＋")
                    }
                    .font(.system(size:42))
                    .foregroundColor(Color.white)
                    .background(
                        Circle()
                            .fill(Color.init(hex:"#69A1AC"))
                            .frame(width: 55, height: 55)
                    )
                    NavigationLink(destination: EditGameView()) {
                        Text("✎")
                    }
                    .font(.system(size:36))
                    .foregroundColor(Color.white)
                    .background(
                        Circle()
                            .fill(Color.init(hex:"#E58B1E"))
                            .frame(width: 55, height: 55)
                    )
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct EditQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        EditQuestionView(gameID: 123)
    }
}
