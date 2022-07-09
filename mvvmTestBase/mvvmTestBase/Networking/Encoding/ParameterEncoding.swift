//
//  ParameterEncoding.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//
import Foundation
/// We use a typealias to make our code cleaner and more concise.
public typealias Parameters = [String:Any]
/// The encode method takes two parameters an inout URLRequest and Parameters. (To avoid ambiguity from henceforth I will refer to function parameters as arguments.) INOUT is a Swift keyword that defines an argument as a reference argument. Usually, variables are passed to functions as value types. By placing inout in front of the argument we define it as a reference type.
public protocol ParameterEncoder {
 static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    public func encode(urlRequest: inout URLRequest,
                       bodyParameters: Parameters?,
                       urlParameters: Parameters?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEnconder.encode(urlRequest: &urlRequest, with: urlParameters)
                
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder.encode(urlRequest: &urlRequest, with: bodyParameters)
                
            case .urlAndJsonEncoding:
                guard let bodyParameters = bodyParameters,
                    let urlParameters = urlParameters else { return }
                try URLParameterEnconder.encode(urlRequest: &urlRequest, with: urlParameters)
                try JSONParameterEncoder.encode(urlRequest: &urlRequest, with: bodyParameters)
                
            }
        }catch {
            throw error
        }
    }
}
///
public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}
