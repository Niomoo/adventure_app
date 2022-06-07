//
//  CheckView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI

struct CheckView: View {
    @State var title = "踏溯台南"
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
                ScrollView {
                    Menu("Question A") {
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("刪除")
                        }
                    }
                    .frame(width: 315, height: 87)
                    .font(.system(size:18))
                    .foregroundColor(Color.black)
                    .background(Color.init(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    Menu("Question B") {
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("刪除")
                        }
                    }
                    .frame(width: 315, height: 87)
                    .font(.system(size:18))
                    .foregroundColor(Color.black)
                    .background(Color.init(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    Menu("Question C") {
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("刪除")
                        }
                    }
                    .frame(width: 315, height: 87)
                    .font(.system(size:18))
                    .foregroundColor(Color.black)
                    .background(Color.init(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
                    Menu("Question D") {
                        NavigationLink(destination: CheckView()) {
                            Text("編輯")
                        }
                        NavigationLink(destination: CheckView()) {
                            Text("刪除")
                        }
                    }
                    .frame(width: 315, height: 87)
                    .font(.system(size:18))
                    .foregroundColor(Color.black)
                    .background(Color.init(UIColor(red: 0.839, green: 0.89, blue: 0.886, alpha: 1).cgColor))
                    .cornerRadius(8)
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
        CheckView()
    }
}
