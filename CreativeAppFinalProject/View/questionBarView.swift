//
//  questionBarView.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//

import SwiftUI


struct questionBarView: View {
    var choice:OneQuesChoices
    var body: some View {
            HStack{
                Text(choice.id)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white,lineWidth: 3)
                            .frame(width:200,height: 60)
                    )
                
                
//                Button(action: {
//                    optionButton.toggle()
//                    print("Button Tap")
//                }, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(optionButton ?  .black:.white,lineWidth: 3)
//                            .background(optionButton ? .white:.black)
//                            .frame(width: 320, height: 60)
//                        Text(choice.id)
//                            .foregroundColor(optionButton ? .black:.white)
//                    }
//
//                })
            }
            .frame(width: 250, height: 60)
            
        }
    }

struct questionBarView_Previews: PreviewProvider {
    static var previews: some View {
        questionBarView(choice: Choice[0].oneQuesChoice[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
