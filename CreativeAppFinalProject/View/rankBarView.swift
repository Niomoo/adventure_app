//
//  rankBarView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//

import SwiftUI

struct rankBarView: View {
    var rank:RankData
    var body: some View {
        HStack(alignment: .top){
            Text(rank.id)
                .bold()
            Spacer()
            Text(rank.score)
        }
        .frame(width: 320, height: 60)
        .overlay(RoundedRectangle(cornerRadius:10)
            .stroke(Color.black,lineWidth: 3)
            .frame(width: 330, height: 60))
    }
}

struct rankBarView_Previews: PreviewProvider {
    static var previews: some View {
        rankBarView(rank: Rank[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
