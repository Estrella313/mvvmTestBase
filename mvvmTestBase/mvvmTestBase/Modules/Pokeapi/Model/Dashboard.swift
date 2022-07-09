//
//  Dashboard.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import UIKit
// MARK: The model layer is responsible for the business logic of the application. It manages the application state. This also includes reading and writing data, persisting application state, and it may even include tasks related to data management, such as networking and data validation.

// MARK: Un simple model. 
typealias Pokemons = [Pokemon]

// MARK: - Pokemon
/// Estructura para llenado de tabla del pokédex
struct Pokemon: Decodable, Identifiable {
    /// ID o número de pokémon
    let id: Int
    /// Nombre del pokémon
    let name: String
    /// Url de la imagen del pokémon
    let imageUrl: String
    /// Tipo o clase de pokémon
    let type: String
    /// Inicializador de estructura
    /// - Parameters:
    ///     - id: ID o número de pokémon
    ///     - name: Nombre del pokémon
    ///     - imageUrl: Url de la imagen del pokémon
    ///     - type: Tipo o clase de pokémon
    init (id: Int = 0, name: String = String(), imageUrl: String = String(), type: String = String()) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.type = type
    }
}
extension Pokemon {
    /// Función encargada de asignar el color de fondo de la celda
    /// - Parameter type: tipo de pokémon.
    /// - Returns: Color de fondo.
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
}
