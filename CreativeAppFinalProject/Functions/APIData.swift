//
//  APIData.swift
//  CreativeAppFinalProject
//
//  Created by 劉育瑄 on 2022/6/8.
//

import Foundation

struct Player {
    let name: String
    let score: Int
    let rank: Int
}
extension Player: Codable { }

struct NewPlayer {
    let gameID: Int
    let name: String
}
extension NewPlayer: Codable { }

struct Account {
    let account: String
    let password: String
}
extension Account: Codable { }

struct Manager {
    let account: String
}
extension Manager: Codable { }

struct Game {
    let gameID: Int
    let title: String
    let description: String
    let status: Int
}
extension Game: Codable { }

struct ManageGame {
    let account: String
    let title: String
    let description: String
}
extension ManageGame: Codable { }

struct Choice {
    let text: String
    let answer: Int
}
extension Choice: Codable { }

struct Question {
    let questionID: Int
    let question: String
    let qType: Int
    let latitude: String
    let longitude: String
    let score: Int
    let choice: [Choice]
    let feedback_right: String
    let feedback_wrong: String
}
extension Question: Codable { }

struct ManageQuestion {
    let gameID: Int
    let question: String
    let qType: Int
    let latitude: String
    let longitude: String
    let score: Int
    let choice: [Choice]
    let feedback_right: String
    let feedback_wrong: String
}
extension ManageQuestion: Codable { }

struct GameList {
    let games: [Game]
}
extension GameList: Codable { }

struct QuestionList {
    let questions: [Question]
}
extension QuestionList: Codable { }

struct RankList {
    let players: [Player]
}
extension RankList: Codable { }

struct NewScore {
    let gameID: Int
    let name: String
    let score: Int
}
extension NewScore: Codable { }
