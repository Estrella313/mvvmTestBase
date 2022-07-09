//
//  JSONParameterEncoder.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//
import Foundation
/// Similar to the URLParameter encoder but here we encode the parameters to JSON and add appropriate headers once again.
public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}
