//
//  DetailVC.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 23/06/22.
//
import UIKit
final class DetailVC: UIViewController {
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var subtitleLabel: UILabel!
    /// Objeto para comunicación con view model
    var pokemonViewModel: PokemonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon"
        if let pokemon = pokemonViewModel {
            titleLabel.text = pokemon.name
            subtitleLabel.text = pokemon.type
        }
    }
}
