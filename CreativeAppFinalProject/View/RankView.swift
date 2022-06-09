//
//  RankView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI
import UIKit


struct RankView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var RankIn:RankList
    
    //init() { UITableView.appearance().backgroundColor = UIColor.clear }
    // <<: here!
    var body: some View {
        VStack{
            let Rank = generateRankOutpu(Rank: RankIn)
            List(Rank){
                r in
                rankBarView(rank: r)
//                    .listRowBackground(Color.init(hex: "#69A1AC"))
            }
            
            Spacer()
            Button("Back") {
                dismiss()
            }
            .foregroundColor(.black)
            .font(.title)
        }
        .background(Color.init(hex: "#69A1AC"))
        
    }
}

//struct RankView_Previews: PreviewProvider {
//    static var previews: some View {
//        RankView()
//    }
//}
