//
//  ManualController.swift
//  CreativeAppFinalProject
//
//  Created by 劉育瑄 on 2022/6/7.
//

import Foundation
import ImageIO

enum HTTPMethod: String {
    case GET
    case POST
    case PATCH
    case DELETE
}

protocol APIRequest {
    associatedtype Response

    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var request: URLRequest { get }
//    var postData: Data? { get }
    var httpBody: Data? { get }
    var httpMethod: HTTPMethod { get }
}

extension APIRequest {
    var host: String { "http://5ee8-59-127-156-17.ngrok.io" }
//    var port: Int { 3000 }
}

extension APIRequest {
    var queryItems: [URLQueryItem]? { nil }
//    var postData: Data? { nil }
    var httpBody: Data? { nil }
    var httpMethod: HTTPMethod { .GET }
}

extension APIRequest {
    var request: URLRequest {
        var components = URLComponents()

        components.scheme = "http"
        components.host = host
//        components.port = port
        components.path = path
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        if let httpBody = httpBody {
            request.httpBody = httpBody
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
//        if let data = postData {
//            request.httpBody = data
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//        }

        return request
    }
}

extension APIRequest where Response: Decodable {
    func send(completion: @escaping (Result<Response, Error>) -> Void) {
        URLSession.shared.dataTask(with: request){ data, _, error in
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decoded = try decoder.decode(Response.self, from: data)
                    completion(.success(decoded))
                } else if let error = error {
                    completion(.failure(error))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension APIRequest {
    func send(completion: @escaping (Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { _, _, error in
            completion(error)
        }.resume()
    }
}
