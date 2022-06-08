//
//  CheckView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

var allQuestions = [
    QuestionData(id:"1", score:"3", question:"高雄輕軌有經過駁二特區嗎？", feedback_true: "go left", feedback_false: "go right", longitude: "120.28149", latitude: "22.61987"),
    QuestionData(id:"2", score:"2", question:"哪一座大學在西子灣？", feedback_true: "go left", feedback_false: "go right", longitude: "120.26385", latitude: "22.6268"),
    QuestionData(id:"3", score:"1", question:"椅子樂譜是由幾張椅子組成？", feedback_true: "go left", feedback_false: "go right", longitude: "120.28644", latitude: "22.61799")
]

struct CheckView: View {
    @State var account:String
    @State var title = "踏溯高雄"
    @State var rID = "GA0001"
    @State var description = "Pellentesque ut tellus luctus, fermentum justo quis, lobortis mi. Praesent volutpat odio non neque iaculis condimentum. Aenean arcu leo, sollicitudin vel pulvinar vel, fermentum ut dolor."
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                Text(title)
                    .font(.system(size:28))
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                    .frame(width:315, alignment: .leading)
                Text("# " + rID)
                    .frame(width:315, alignment: .leading)
                    .padding(.bottom)
                Text(description)
                    .frame(width:315, alignment: .leading)
                    .padding(.bottom)

                Text("問題列表")
                    .underline(color: Color.init(hex:"#69A1AC"))
                    .frame(width:315, alignment: .leading)
                List(allQuestions) { element in
                    Text("\(element.question)")
                }
                HStack(spacing:50) {
                    NavigationLink(destination: DashboardView(account: account)) {
                        Text("←")
                    }
                    .font(.system(size:42))
                    .foregroundColor(Color.white)
                    .background(
                        Circle()
                            .fill(Color.black)
                            .frame(width: 55, height: 55)
                    )
                    .frame(width:280, alignment: .leading)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(account: "abc")
    }
}
