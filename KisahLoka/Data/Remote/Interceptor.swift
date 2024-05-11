//
//  Interceptor.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

//import Alamofire
//
//class APILogInterceptor: RequestInterceptor {
//    
//    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
//        var modifiedRequest = urlRequest
//        // You can modify the request here if needed
//        
//        // Print adapted request
//        print("")
//        print("# REQUEST")
//        if let method = modifiedRequest.httpMethod, let url = modifiedRequest.url {
//            print("--> \(method) - \(url)")
//        }
//        if let headers = modifiedRequest.allHTTPHeaderFields {
//            print("Headers: \(headers)")
//        }
//        if let body = modifiedRequest.httpBody, let requestBody = String(data: body, encoding: .utf8) {
//            print("Data: \(requestBody)")
//        }
//        print("--> END \(modifiedRequest.httpMethod ?? "")")
//        
//        completion(.success(modifiedRequest))
//    }
//    
//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//        // You can handle retry logic here if needed
//        completion(.doNotRetry)
//    }
//    
//    func intercept(
//        _ request: URLRequest,
//        response: HTTPURLResponse?,
//        data: Data?,
//        error: Error?,
//        for session: Session,
//        completion: @escaping (Result<URLRequest, Error>) -> Void
//    ) {
//        if let error = error {
//            // Handle error here
//            print("")
//            print("# ERROR")
//            if let statusCode = response?.statusCode, let url = request.url {
//                print("<-- \(statusCode) - \(url)")
//            }
//            print("Message: \(error.localizedDescription)")
//            print("<-- END HTTP")
//        }
//        
//        if let httpResponse = response {
//            // Handle response here
//            print("")
//            print("# RESPONSE")
//            if let statusCode = response?.statusCode, let url = request.url {
//                print("<-- \(statusCode) - \(url)")
//            }
//            if let responseData = data, let responseBody = String(data: responseData, encoding: .utf8) {
//                print("Response: \(responseBody)")
//            }
//            print("<-- END HTTP")
//        }
//        
//        // You can also modify the request/response here if needed
//        completion(.success(request))
//    }
//}
