//
//  Data.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//
//
import Foundation
import SwiftUI

var Rank: [RankData] = load("Score.json")
var Question: [QuestionData] = []//load("ScoreTest.json")
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
    oneQuesChoice:[OneQuesChoices(id:"1325",status:1),
                   OneQuesChoices(id:"25",status:0)])

let Choice = [Ques1Choice,Ques2Choice,Ques3Choice]


struct RankData: Identifiable,Codable,Hashable{
    var id:String
    var score:String
    var rank:String
}

func generateRankOutpu(Rank:RankList)->[RankData]{
    var RankOutput:[RankData] = []
    for i in 0..<Rank.ranks.count{
        RankOutput.append(RankData(id: Rank.ranks[i].nickname, score: String(Rank.ranks[i].score), rank: String(Rank.ranks[i].rank)))
    }
    return RankOutput
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

func updatescore(PlayerName:String,AddScore:String)->RankData{
    var r:RankData=Rank[0]
    var addScore = Int(AddScore) ?? 0
    for i in (0..<Rank.count){
        if(Rank[i].id==PlayerName){
            var score = Int(Rank[i].score) ?? 0
            score+=addScore
            Rank[i].score = String(score)
            r = Rank[i]
        }
    }
    return r
}

func sortRank()->[RankData]{
    Rank.sort{$0.score>$1.score}
    for i in (0..<Rank.count){
        Rank[i].rank = String(i+1)
    }
    return Rank
}

func updateRank(Rank11:RankList)->Int{
    var inRank = false
    for i in( 0..<Rank11.ranks.count){
        inRank = false
        for j in (0..<Rank.count){
            if(Rank[j].id==Rank11.ranks[j].nickname){
                Rank[j].rank = String(Rank11.ranks[i].rank)
                Rank[j].score = String(Rank11.ranks[i].score)
                break
            }
            else{
                inRank = true
            }
        }
        if(inRank){
            Rank.append(RankData(id: Rank11.ranks[i].nickname, score: String(Rank11.ranks[i].score), rank: String(Rank11.ranks[i].rank)))
        }
    }
    return 0
}

func addQuestions(Question11:QuestionList)->Int{
    for i in(0..<Question11.questions.count){
        Question.append(QuestionData(id:String( Question.count+1), score: String(Question11.questions[i].score), question: Question11.questions[i].question, feedback_true: Question11.questions[i].feedbackRight, feedback_false: Question11.questions[i].feedbackWrong, longitude: String(Question11.questions[i].longitude), latitude: String(Question11.questions[i].latitude)))
    }
    return 0
}


func addAnnotation()->[AnnotatedItem]{
    var pointsOfIntrest:[AnnotatedItem] = []
    for item in Question{
        let q = Int(item.id) ?? 1
        pointsOfIntrest.append(AnnotatedItem(name: item.question, coordinate: .init(latitude: Double(item.latitude) ?? 0, longitude: Double(item.longitude) ?? 0), ques: q-1))
    }
    return pointsOfIntrest
}
