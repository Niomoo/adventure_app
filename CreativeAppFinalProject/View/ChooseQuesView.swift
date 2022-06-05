//
//  ChooseQuesView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/4.
//

import SwiftUI

struct ChooseQuesView: View {
    var body: some View {
        List(Question){
            q in questionBarView(ques: q)
        }
    }
}

struct ChooseQuesView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseQuesView()
    }
}
