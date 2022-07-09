//
//  DashboardCell.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import UIKit
final class DashboardTableViewCell: UITableViewCell {
    /// Imagen de estatus de selección.
    @IBOutlet weak var imgCell: UIImageView!
    /// Título de la celda.
    @IBOutlet weak var lblTitle: UILabel!
    /// Título de la celda.
    @IBOutlet weak var lblSubTitle: UILabel!
    
    func configure(pokemon: PokemonViewModel) {
        lblTitle.text = pokemon.name
        lblSubTitle.text = pokemon.type
        //imgCell.image = UIImage(named: data.image)
    }
}
