//
//  Data.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//
//
import Foundation
import SwiftUI

let Rank: [RankData] = load("Score.json")
let Question: [QuestionData] = load("ScoreTest.json")
let
Ques1Choice = Choices(
    oneQuesChoice:[OneQuesChoices(id:"yes",status:1),
                   OneQuesChoices(id:"no",status:0)])

let
Ques2Choice = Choices(
    oneQuesChoice:[OneQuesChoices(id:"nsysu",status:1),
                   OneQuesChoices(id:"ncku",status:0)])
let
Ques3Choice = Choices(
    oneQuesChoice:[OneQuesChoices(id:"E",status:1),
                   OneQuesChoices(id:"F",status:0)])

let Choice = [Ques1Choice,Ques2Choice,Ques3Choice]


struct RankData: Identifiable,Codable,Hashable{
    var id:String
    var score:String
    var rank:String
}

struct QuestionData:Identifiable,Codable{
    var id:String
    var score:String
    var question:String
    var feedback_true:String
    var feedback_false:String
    var longitude:String
    var latitude:String
}

struct OneQuesChoices:Identifiable{
    var id:String
    var status:Int
}

struct Choices{
    var oneQuesChoice:[OneQuesChoices]
}

//struct record:Codable{
//    var feedback_true:String
//    var feedback_false:String
//    var type:Int
//    var latitude:Double
//    var longitude:Double
//    var choice:Int
//}


func load<T: Decodable>(_ filename: String)-> T{
    let data:Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("can't find \(filename)")
    }

    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("can't load \(filename)")
    }

    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("can't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getDat(PlayerName:String)->[String]{
    var currentScore:String = ""
    var currentRank:String = ""
    for item in Rank{
        if(item.id==PlayerName){
            currentRank = item.rank
            currentScore = item.score
        }
    }
    return [currentScore,currentRank]
}
