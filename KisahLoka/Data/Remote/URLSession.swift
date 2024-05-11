//
//  URLSession.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

class AppURLSession {
    func getBasicURLSession(
        headers: [String: String] = [:],
        connectTimeout: TimeInterval = 30,
        receiveTimeout: TimeInterval = 30
    ) -> URLSession{
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = connectTimeout
        config.timeoutIntervalForResource = receiveTimeout
        
        var defaultHeaders = headers
        defaultHeaders["Content-Type"] = "application/json"
        
        let session = URLSession(configuration: config)
        return session
    }
}
//    func getURLSession(headers: [String: String] = [:], connectTimeout: TimeInterval = 30, receiveTimeout: TimeInterval = 30) -> URLSession {
//        var defaultHeaders = headers
//        let token = SecureStorageManager().getToken() ?? ""
//        if !defaultHeaders.keys.contains("Authorization") && !token.isEmpty {
//            defaultHeaders["Authorization"] = "Bearer \(token)"
//        }
//
//        let config = URLSessionConfiguration.default
//        config.timeoutIntervalForRequest = connectTimeout
//        config.timeoutIntervalForResource = receiveTimeout
//
//        let session = URLSession(configuration: config)
//        return session
//    }
//}
