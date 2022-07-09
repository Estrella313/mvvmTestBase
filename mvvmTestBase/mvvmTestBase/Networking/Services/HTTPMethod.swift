//
//  HTTPMethod.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//

import Foundation
/// This enum will be used to set the HTTP method of our request.
public enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
