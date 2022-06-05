//
//  Data.swift
//  CreativeAppFinalProject
//
//  Created by 尹子維 on 2022/6/5.
//

import Foundation
import SwiftUI

let Rank: [RankData] = load("Score.json")
let Question: [QuestionData] = load("ScoreTest.json")

struct RankData: Identifiable,Codable,Hashable{
    var id:String
    var score:String
    var rank:String
}

struct QuestionData:Identifiable,Codable{
    var id:String
    var score:String
    var question:String
}

struct record:Codable{
    
    var feedback_true:String
    var feedback_false:String
    var type:Int
    var latitude:Double
    var longitude:Double
    var choice:Int
}


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
