//
//  ChooseQuesView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/4.
//

import SwiftUI
struct ChooseQuesView: View {
    var QuesIndex = 0
    var Rid:String
    @State private var optionButton = [false,false]
    @State private var submitButton = false
    @Binding var pName:String
    @State var opt:Int

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 15){
                let Options=Choice[QuesIndex].oneQuesChoice
                VStack(alignment:.leading){
                    Text("踏溯台南")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("\(pName)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .position(x:100, y: -40)
                Text("Q: \(Question[QuesIndex].question)")
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white,lineWidth: 3)
                            .frame(width:350,height: 60)
                    )
                    .offset(y:-300)
                
                ForEach(0..<Options.count){i in
                    HStack{
                        questionBarView(choice: Options[i])
                        Button(action:{
                            optionButton = [false,false]
                            optionButton[i].toggle()
                            opt=i
                        },label: {
                            Image(optionButton[i] ? "Group 108":"Group 15")
                                .frame(width: 60, height: 60)
                        })
                    }
                    .offset(y:-280)
                }
                Spacer()
                NavigationLink{
                    if(Choice[QuesIndex].oneQuesChoice[opt].status==1){
                        AnswerView(QuesIndex: QuesIndex, Rid: Rid,pName: $pName,opt: $opt,correct: true)
                    }else{
                        AnswerView(QuesIndex: QuesIndex, Rid: Rid,pName: $pName,opt: $opt)
                    }
                }label: {
                    Text("Submit")
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white,lineWidth: 3)
                                .frame(width:300,height: 60)
                        )
                }
//                Button(action: {
//                    submitButton.toggle()
//                    print("hello")
//                }, label: {
//                    if(Choice[QuesIndex].oneQuesChoice[opt].status==1){
//                        Text("恭喜答對!積分\(Question[QuesIndex].score)")
//                    }
//                    Text("Submit")
//                        .foregroundColor(.black)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(.black,lineWidth: 3)
//                                .frame(width:200,height: 60)
//                            )
//                })
//                .padding()
                NavigationLink{
                    StartGameView(PlayerName: $pName, Rid: Rid)
                }label: {
                    Text("Back")
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .font(.title)
                        .padding()
                }
            }
            .background(Color.init(hex: "#69A1AC"))
        }
        .hiddenNavigationBarStyle()
        
    }
}

struct ChooseQuesView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseQuesView(QuesIndex: 1, Rid: "123",pName: .constant("p1"),opt: 0)
    }
}
