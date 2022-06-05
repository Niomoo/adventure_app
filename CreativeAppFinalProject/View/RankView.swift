//
//  RankView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/3.
//

import SwiftUI

struct RankView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List(Rank){
            r in rankBarView(rank: r)
        }
        Spacer()
        Button("Back") {
            dismiss()
        }
        .foregroundColor(.black)
        .font(.title)
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
