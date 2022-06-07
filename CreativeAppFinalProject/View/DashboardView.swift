//
//  DashboardView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                NavigationLink(destination: JoinRoomView()) {
                    Text("登出")
                }
                .padding()
                .foregroundColor(.black)
                .frame(width:315, alignment: .trailing)
                Text("Welcome " + "!")
                    .font(.system(size:24))
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                    .frame(width:315, alignment: .leading)
                Text("活動列表")
                    .underline(color: Color.init(hex:"#69A1AC"))
                    .frame(width:315, alignment: .leading)
                ScrollView {
                    NavigationLink(destination: EditQuestionView()) {
                        Text("檢視")
                    }
                    Menu("Game A") {
                        NavigationLink(destination: CheckView()) {
                            Text("檢視")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("開始")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("排行")
                        }
                    }
                    .frame(width: 315, height: 122)
                    .font(.system(size:18))
                    .foregroundColor(Color.white)
                    .background(Color.init(hex:"#69A1AC"))
                    .cornerRadius(8)
                    
                    Menu("Game B") {
                        NavigationLink(destination: CheckView()) {
                            Text("檢視")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("開始")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("排行")
                        }
                    }
                    .frame(width: 315, height: 122)
                    .font(.system(size:18))
                    .foregroundColor(Color.white)
                    .background(Color.init(hex:"#69A1AC"))
                    .cornerRadius(8)
                    Menu("Game C") {
                        NavigationLink(destination: CheckView()) {
                            Text("檢視")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("開始")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("排行")
                        }
                    }
                    .frame(width: 315, height: 122)
                    .font(.system(size:18))
                    .foregroundColor(Color.white)
                    .background(Color.init(hex:"#69A1AC"))
                    .cornerRadius(8)
                    Menu("Game D") {
                        NavigationLink(destination: CheckView()) {
                            Text("檢視")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("開始")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("排行")
                        }
                    }
                    .frame(width: 315, height: 122)
                    .font(.system(size:18))
                    .foregroundColor(Color.white)
                    .background(Color.init(hex:"#69A1AC"))
                    .cornerRadius(8)
                }
                NavigationLink(destination: CreatingGameView()) {
                    Text("＋")
                }
                .font(.system(size:42))
                .foregroundColor(Color.white)
                .background(
                    Circle()
                        .fill(Color.init(hex:"#69A1AC"))
                        .frame(width: 55, height: 55)
                )
                .frame(width:315, alignment: .trailing)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
