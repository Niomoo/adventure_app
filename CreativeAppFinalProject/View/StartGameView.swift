//
//  StartGameView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI
import MapKit

struct StartGameView: View {
    @State var ExitButtonState = false
    @State var RankButtonState = false
    @State var Rank11:RankList = RankList(ranks: [])
    @State var Question11:QuestionList=QuestionList(questions: [])
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.63, longitude: 120.270), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @Binding var PlayerName : String
    var Rid : String
//    var pointsOfInterest = [
//        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: Double(Question[0].latitude) ?? 0, longitude: Double(Question[0].longitude) ?? 0),ques: 0),
//        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: Double(Question[1].latitude) ?? 0, longitude: Double(Question[1].longitude) ?? 0),ques: 1),
//        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: Double(Question[2].latitude) ?? 0, longitude: Double(Question[2].longitude) ?? 0),ques: 2)
//        ]

    
    var body: some View {
        
        NavigationView{
            
            VStack{
                VStack(alignment:.leading){
                    Text("踏溯高雄")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("\(PlayerName)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .position(x: 130)
                HStack{
                    let intg = addQuestions(Question11: Question11)
                    let pointsOfInterest = addAnnotation()
                    Map(coordinateRegion: $region,showsUserLocation: true,annotationItems: pointsOfInterest){
                        item in MapAnnotation(coordinate: item.coordinate)
                        {
                            NavigationLink {
                                ChooseQuesView(QuesIndex:item.ques, Rid: Rid,pName: $PlayerName, opt: 0)
                                        } label: {
                                            Circle()
                                                .stroke(.red, lineWidth: 3)
                                                .frame(width: 44, height: 44)
                                        }
                        }
                    }
                    
                }
                .frame(width: 500, height: 530)
                .background(.white)
                
                HStack(){
                    NavigationLink{
                        JoinRoomView()
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 78, height: 46)
                            .foregroundColor(.black)
                            .overlay(
                                Text("Exit")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                            )
//                        Text("Exit")
//                            .frame(width: 78, height: 46)
//                            .overlay(RoundedRectangle(cornerRadius:10)
//                                .fill(.black))
//                            .foregroundColor(.white)
//                            .font(.title)
//                            .padding()
                            
                    }
                    Button(action:{
                        RankButtonState.toggle()
                        updateRank(Rank11: Rank11)
                        sortRank()
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 78, height: 46)
                            .foregroundColor(.orange)
                            .overlay(
                                Text("Rank")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .sheet(isPresented: $RankButtonState){
                                        RankView().onAppear(){
                                            self.requestRank(gameID: Rid)
                                        }
                                }
                            )
                    
//                    .overlay(RoundedRectangle(cornerRadius:10)
//                        .fill(.orange))
//                    .foregroundColor(.white)
//                    .font(.title)
//                    .padding()
                    
                    }
                    let currentScore = getDat(PlayerName: PlayerName)[0]
                    let currentRank = getDat(PlayerName: PlayerName)[1]
                    VStack{
                        
                        Text("目前排名：\(currentRank)")
                        
                        Text("目前分數：\(currentScore)")
                        }
                }
                Divider()
                Spacer()
            }
            .background(.white)
        }
        .hiddenNavigationBarStyle()
        .onAppear(){
            self.generateQuestions(gameID: Rid)
        }
    }
    func requestRank(gameID:String){
        getRank(gameID: gameID).send{
            result in
            switch result{
            case.success(let rank):
                self.Rank11 = rank
                print(rank.ranks[0].nickname)
            case.failure(let error):
                print(error)
                print("fail")
                break
            }
        }
    }
    
    func generateQuestions(gameID:String){
        getAllQuestions(gameID: Rid).send{
            result in
            switch result{
            case.success(let ques):
                self.Question11 = ques
                print(ques.questions[0].question)
            case.failure(let error):
                print(error)
                print("fail")
                break
            }
        }
    }
    
}



struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var ques:Int
}



struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Text("踏碩台南")
            Text("Apple    35")
                .background(.white)
                .foregroundColor(.black)
                .font(.system(size: 12))
            Text("Banana    32")
            Text("Cat    25")
            Text("共42人參加")
            
            Text("No.29 Guest001   20")
            
            Button("Back") {
                dismiss()
            }
            .foregroundColor(.white)
            .font(.title)
            .padding()
            .offset(y:500)
            Divider()
            Spacer()
        }
        .background(Color.teal)
        
    }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView(PlayerName:.constant("ABC"), Rid:"rid")
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
