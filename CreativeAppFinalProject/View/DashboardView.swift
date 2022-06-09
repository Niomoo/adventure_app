//
//  DashboardView.swift
//  CreativeAppFinalProject
//
//  Created by 李嘉峻 on 2022/6/5.
//

import SwiftUI
var allGames = [
    game(id:1, title:"Game 1", description:"Game1 Description", status: false),
    game(id:2, title:"Game 2", description:"Game2 Description", status: false),
    game(id:3, title:"Game 3", description:"Game3 Description", status: false),
    game(id:4, title:"Game 4", description:"Game4 Description", status: false),
    game(id:5, title:"Game 5", description:"Game5 Description", status: false)
]
struct game:Identifiable {
    var id: Int32
    var title: String
    var description: String
    var status: Bool
}

//struct getAllGames: APIRequest {
//    typealias Response = GameList
//    var manager: String?
//    var path: String { "/getAllGames/" }
//    var queryItems: [URLQueryItem]? { [URLQueryItem(name: "account", value: manager)] }
//}

struct DashboardView: View {
    @State var account: String
    var body: some View {
        NavigationView{
            VStack(spacing:15){
                NavigationLink(destination: JoinRoomView()) {
                    Text("登出")
                }
                .padding()
                .foregroundColor(.black)
                .frame(width:315, alignment: .trailing)
                Text("Welcome \(account)" + "!")
                    .font(.system(size:24))
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                    .frame(width:315, alignment: .leading)
                Text("活動列表")
                    .underline(color: Color.init(hex:"#69A1AC"))
                    .frame(width:315, alignment: .leading)
                    List(allGames) { game in
                        NavigationLink(destination: EditQuestionView(account: account, gameID: game.id)) {
                            Text("\(game.title)")
                        }
                    }
                NavigationLink(destination: CreatingGameView(account: account)) {
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
        .onAppear() {
            self.listAllGames(account: account)
        }
    }
    func listAllGames(account: String){
        getAllGames(manager: account).send { result in
            switch result {
            case .success(let result):
//                allGames = result.games
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(account: "abc")
    }
}
