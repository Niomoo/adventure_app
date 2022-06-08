//
//  NetworkController.swift
//  CreativeAppFinalProject
//
//  Created by 劉育瑄 on 2022/6/9.
//

import Foundation
class NetworkController {
    static let shared = NetworkController()
    func listAllGames(account: String){
        getAllGames(manager: account).send { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
