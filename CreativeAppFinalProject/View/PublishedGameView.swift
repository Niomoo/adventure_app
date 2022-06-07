//
//  PublishedGameView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

struct PublishedGameView: View {
    @State var rID = "GA0001"
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                Image("humaaan-9")
                VStack(alignment: .leading){
                    Text("Your Game is Live!")
                        .font(.system(size:24))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                        .frame(width:315, alignment: .leading)
                    Text("Now you can share your game code to others")
                        .font(.system(size:18))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                        .frame(width:315, alignment: .leading)
                    Text("Game Code")
                        .font(Font.system(size:14))
                        .foregroundColor(.white)
                        .frame(width:315, alignment: .leading)
                    Text("# " + rID + "                                                ")
                        .padding()
                        .background(Color(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                        .cornerRadius(8)
                        .frame(width:315, alignment: .leading)
                }
                Spacer()
                NavigationLink(destination: DashboardView()) {
                    Text("End Game")
                        .frame(width: 315, height: 50)
                        .font(.system(size:18))
                        .foregroundColor(.white)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                }
                NavigationLink(destination: DashboardView()) {
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

struct PublishedGameView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedGameView()
    }
}
