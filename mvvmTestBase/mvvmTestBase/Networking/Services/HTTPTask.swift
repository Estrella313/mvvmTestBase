//
//  HTTPTask.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//

import Foundation
/// Alias para manejar los encabezados.
public typealias HTTPHeaders = [String:String]
/// HTTPTask is responsible for configuring parameters for a specific endPoint. 
public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
