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
        ZStack{
            RoundedRectangle(cornerRadius:10)
                .stroke(.white,lineWidth: 3)
                .frame(width: 330, height: 60)
            HStack(alignment: .top){
                Text(rank.id)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text(rank.score)
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 60)
        }
        
    }
}

struct rankBarView_Previews: PreviewProvider {
    static var previews: some View {
        rankBarView(rank: Rank[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
