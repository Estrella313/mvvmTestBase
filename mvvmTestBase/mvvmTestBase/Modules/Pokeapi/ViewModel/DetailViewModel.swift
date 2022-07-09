//
//  DetailViewModel.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 23/06/22.
//
import Foundation
class DetailViewModel: NSObject {
    /// Pokemons de pokeapi
    var pokemon : Pokemon?
    /// Constructor del objeto.
    override init() {
        super.init()
    }
    /// Constructor del objeto.
    /// - Parameter pokemon: información del pokemon.
    convenience init(pokemon: Pokemon) {
        self.init()
        self.pokemon = pokemon
    }
}
