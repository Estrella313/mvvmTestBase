//
//  DashboardViewModel.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import Foundation
// MARK: The view layer and the model layer are glued together by one or more controllers. In iOS and tvOS applications, for example, that glue is a view controller, an instance of the UIViewController class or a subclass thereof. A controller knows about the view layer as well as the model layer. This often results in tight coupling, making controllers the least reusable components of an MVC application. The view layer and the model layer don't know about the controller. The controller owns the views and the models it interacts with.

// MARK: Obtiene toda la información que se obtiene del VC, administra todos los datos y los regresa a la vista.
class DashboardViewModel: NSObject {
    /// Objeto tipo **PokemonsService** para llamar a consumir los servicios del modelo de Dashboard
    private var networkManager: NetworkManager
    var reloadTableView: (() -> Void)?
    /// Pokemons de pokeapi
    private(set) var pokemons: [Pokemon]? {
        didSet {
            reloadTableView?()
        }
    }
    init(networkManager: NetworkManager = NetworkManager()) {
           self.networkManager = networkManager
   }
    /// Función que llama al servicio y obtiene su respuesta
    func getPokemonData() {
        self.networkManager.getPokemons { success, pokemonData, error in
            if success {
                self.pokemons = pokemonData
            } else {
                print(error ?? "Ups algo salio mal")
            }
        }
    }
}
