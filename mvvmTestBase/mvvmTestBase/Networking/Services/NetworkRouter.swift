//
//  NetworkRouter.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//

import Foundation
public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
// A NetworkRouter has an EndPoint which it uses to make requests and once the request is made it passes the response to the completion.
protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
