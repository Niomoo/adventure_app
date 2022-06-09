//
//  AnswerView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/6.
//

import SwiftUI

struct AnswerView: View {
    var QuesIndex = 0
    var Rid:String
    @State var RankButtonState=false
    @Binding var pName:String
    @Binding var opt:Int
    @Binding var Rank:RankList
    var correct = false
    var body: some View {
        NavigationView{
           
            VStack(alignment: .center, spacing: 15){
                let Options=Choice[QuesIndex].oneQuesChoice
                
                VStack(alignment: .leading){
                    Text("踏溯高雄")
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
                    .offset(y:-120)
                
                
                ForEach(0..<Options.count){i in
                    HStack{
                        questionBarView(choice: Options[i])
                        if(correct){
                            if(Choice[QuesIndex].oneQuesChoice[i].status==1){
                                Image("Group 108 (1)")
                            }else{
                                Image("Group 15")
                            }
                        }else{
                            if(Choice[QuesIndex].oneQuesChoice[i].status==1){
                                Image("Group 108 (1)")
                            }else if(i==opt){
                                Image("Group 15 (1)")
                            }else{
                                Image("Group 15")
                            }
                        }
                    }
                    .offset(y:-100)
                }
                VStack{
                    if(correct){
//                        var k = sortRank()
                        Text("恭喜答對獲得\(Question[QuesIndex].score)分")
                            .font(.system(size: 25,weight: .bold))
                            .foregroundColor(.white)
                    }else{
                        Text("可惜答錯")
                            .font(.system(size: 25,weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    if(correct){
                        VStack(alignment: .leading){
                            Text("FeedBack")
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width:300,height: 60)
                                .overlay(
                                    Text("\(Question[QuesIndex].feedback_true)")
                                )
                        }
                    }else{
                        VStack(alignment: .leading){
                            Text("FeedBack")
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.init(hex: "#fcf5e1"))
                                .frame(width:350,height: 60)
                                .overlay(
                                    Text("\(Question[QuesIndex].feedback_false)")
                                )
                            
                        }
                        
                    }
                }
                .offset(y:-80)
                .padding()
                Spacer()
                Divider()
                Button(action:{
                    RankButtonState.toggle()
                },label: {
                    Text("Ranking")
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white,lineWidth: 3)
                                .frame(width:300,height: 60)
                        )
                        .sheet(isPresented: $RankButtonState){
                            RankView(RankIn: $Rank)
                        }
                })
                        
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
//struct AnswerView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            AnswerView(Rid: "123", pName:.constant("abc"),opt: .constant(1))
//        }
//    }
//}
}
