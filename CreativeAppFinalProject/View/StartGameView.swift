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
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @Binding var PlayerName : String
    var pointsOfInterest = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
        ]
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment:.leading){
                    Text("踏碩台南")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("\(PlayerName)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .position(x: 90, y: -20)
                
                HStack(){
                    Map(coordinateRegion: $region,showsUserLocation: true,annotationItems: pointsOfInterest)
                    {
                        item in MapAnnotation(coordinate: item.coordinate)
                        {
                            NavigationLink {
                                            ChooseQuesView()
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
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 78, height: 46)
                            .foregroundColor(.orange)
                            .overlay(
                                Text("Rank")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .sheet(isPresented: $RankButtonState){
                                    RankView()
                                }
                            )
                    
//                    .overlay(RoundedRectangle(cornerRadius:10)
//                        .fill(.orange))
//                    .foregroundColor(.white)
//                    .font(.title)
//                    .padding()
                    
                    }
                    
                    VStack{
                        Text("目前排名：")
                        
                        Text("目前分數：")
                    }
                }
                Divider()
                Spacer()
            }
            .background(.white)
        }
        .hiddenNavigationBarStyle()
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
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
        StartGameView(PlayerName:.constant("abc"))
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

