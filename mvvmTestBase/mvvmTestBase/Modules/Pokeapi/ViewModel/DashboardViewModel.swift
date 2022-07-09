//
//  DashboardViewModel.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import Foundation

class PokedexViewModel {
    var pokemons = [Pokemon]()
}
    
extension PokedexViewModel {
    func numberOfRows(_ section: Int) -> Int {
        return pokemons.count
    }
    
    func modelAt(_ index: Int) -> PokemonViewModel {
        let pokemon = self.pokemons[index]
        return PokemonViewModel(pokemon)
    }
}

class PokemonViewModel {
    private let pokemon: Pokemon
    
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}

extension PokemonViewModel {
    var name: String {
        return self.pokemon.name
    }
    var type: String {
        return self.pokemon.type
    }
}
