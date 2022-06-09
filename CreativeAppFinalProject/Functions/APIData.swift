//
//  APIData.swift
//  CreativeAppFinalProject
//
//  Created by 劉育瑄 on 2022/6/8.
//

import Foundation

struct Player {
    var nickname: String
    var score: Int
    var rank: Int
}
extension Player: Codable { }

struct NewPlayer {
    var gameID: String
    var name: String
}
extension NewPlayer: Codable { }

struct Account {
    var account: String
    var password: String
}
extension Account: Codable { }

struct Manager {
    var account: String
}
extension Manager: Codable { }

struct Game : Codable {
    let descriptionField : String?
    let gameID : Int?
    let status : Int?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case gameID = "gameID"
        case status = "status"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        gameID = try values.decodeIfPresent(Int.self, forKey: .gameID)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}

struct ManageGame {
    var account: String
    var title: String
    var description: String
}
extension ManageGame: Codable { }

struct ChoiceA {
    var content: String
    var status: Int
}
extension ChoiceA: Codable { }

struct QuestionA {
    var questionID: Int
    var question: String
    var type: Int
    var latitude: Double
    var longitude: Double
    var score: Int
    var choice: [ChoiceA]
    var feedbackRight: String
    var feedbackWrong: String
}
extension QuestionA: Codable { }

struct ManageQuestion {
    var gameID: Int
    var question: String
    var qType: Int
    var latitude: String
    var longitude: String
    var score: Int
    var choice: [ChoiceA]
    var feedback_right: String
    var feedback_wrong: String
}
extension ManageQuestion: Codable { }

struct GameList : Codable {
    let games : [Game]?

    enum CodingKeys: String, CodingKey {
        case games = "games"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        games = try values.decodeIfPresent([Game].self, forKey: .games)
    }
}

struct QuestionList {
    var questions: [QuestionA]
}
extension QuestionList: Codable { }

struct RankList {
    var ranks: [Player]
}
extension RankList: Codable { }

struct NewScore {
    var gameID: Int
    var name: String
    var score: Int
}
extension NewScore: Codable { }
