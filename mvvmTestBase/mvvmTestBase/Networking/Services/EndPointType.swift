//
//  EndPointType.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 27/06/22.
//
import Foundation

/// Has a number of HTTP protocols that we need for building an entire endPoint.
protocol EndPointType {
    /// URL base de petición
    var baseUrl: URL { get }
    /// resto de url
    var path: String { get }
    /// tipo de metodo
    var httpMethod: HTTPMethod { get }
    /// Encargada de la configuración de los parametros
    var task: HTTPTask { get }
    /// Encabezados agregados en el servicio.
    var headers: HTTPHeaders? { get }
}
