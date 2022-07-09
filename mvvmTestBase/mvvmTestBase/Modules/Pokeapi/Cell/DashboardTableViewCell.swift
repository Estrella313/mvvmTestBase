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
    /// Función que pone en estado de seleccionado la celda.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /**
     Función que llena las celdas con la información enviada.
    - Parameter data: Variable tipo **Pokemon** contiene la información de cada celda.
     */
    func configure(data: Pokemon) {
        lblTitle.text = data.name
        lblSubTitle.text = data.type
        //imgCell.image = UIImage(named: data.image)
    }
}
