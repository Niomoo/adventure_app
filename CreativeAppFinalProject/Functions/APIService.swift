//
//  File.swift
//  CreativeAppFinalProject
//
//  Created by 劉育瑄 on 2022/6/8.
//

import Foundation

struct login: APIRequest {
    typealias Response = [String: Manager]
    var loginAccount: Account
    var path: String { "/login" }
    var httpMethod: HTTPMethod { .POST }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(loginAccount)
    }
}

struct createAccount: APIRequest {
    typealias Response = [String: Manager]
    var create: Account
    var path: String { "/createAccount" }
    var httpMethod: HTTPMethod { .POST }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(create)
    }
}

struct getAllGames: APIRequest {
    typealias Response = GameList
    var manager: String?
    var path: String { "/getAllGames" }
    var queryItems: [URLQueryItem]? { [URLQueryItem(name: "account", value: manager)] }
}

struct getAllQuestions: APIRequest {
    typealias Response = QuestionList
    var gameID: String?
    var path: String { "/getAllQuestions" }
    var queryItems: [URLQueryItem]? { [URLQueryItem(name: "gameID", value: gameID)] }
}

struct createGame: APIRequest {
    typealias Response = Void
    var game: ManageGame
    var path: String { "/createGame" }
    var httpMethod: HTTPMethod { .POST }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(game)
    }
}

struct updateGame: APIRequest {
    typealias Response = Void
    var game: ManageGame
    var path: String { "/updateGame" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(game)
    }
}

struct startGame: APIRequest {
    typealias Response = Void
    var gameID: String
    var path: String { "/startGame" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(gameID)
    }
}

struct endGame: APIRequest {
    typealias Response = Void
    var gameID: String
    var path: String { "/endGame" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(gameID)
    }
}

struct createQuestion: APIRequest {
    typealias Response = Void
    var question: ManageQuestion
    var path: String { "/createQuestion" }
    var httpMethod: HTTPMethod { .POST }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(question)
    }
}

struct updateQuestion: APIRequest {
    typealias Response = Void
    var question: Question
    var path: String { "/updateQuestion" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(question)
    }
}

struct getScore: APIRequest {
    typealias Response = Player
    var gameID: String?
    var path: String { "/geScore" }
    var queryItems: [URLQueryItem]? { [URLQueryItem(name: "gameID", value: gameID)] }
}

struct joinGame: APIRequest {
    typealias Response = Void
    var player: NewPlayer
    var path: String { "/joinGame" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(player)
    }
}

struct updateScore: APIRequest {
    typealias Response = Void
    var newScore: NewScore
    var path: String { "/updateScore" }
    var httpMethod: HTTPMethod { .PATCH }
    var httpBody: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(newScore)
    }
}
