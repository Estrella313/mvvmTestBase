//
//  Helpers.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import Foundation
extension Data {
    /// Función que convierte la respuesta del servicio a tipo Data en caso de exito
    /// - Parameter string: texto que debe ser removido en caso de encontrarse.
    /// - Returns: regresa la respuesta del servicio en tipo Data.
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
