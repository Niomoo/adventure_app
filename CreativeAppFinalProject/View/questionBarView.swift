//
//  questionBarView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//

import SwiftUI


struct questionBarView: View {
    var ques:QuestionData
    var body: some View {
            HStack(alignment: .top){
                Text(ques.question)
                    .bold()
                Spacer()
            }
            .frame(width: 320, height: 60)
            .overlay(RoundedRectangle(cornerRadius:10)
                .stroke(Color.black,lineWidth: 3)
                .frame(width: 330, height: 60))
        }
    }

struct questionBarView_Previews: PreviewProvider {
    static var previews: some View {
        questionBarView(ques: Question[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
