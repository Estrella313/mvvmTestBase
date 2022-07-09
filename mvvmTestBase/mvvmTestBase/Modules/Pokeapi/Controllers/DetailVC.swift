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
    var detailViewModel: DetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon"
        if let value = detailViewModel?.pokemon {
            titleLabel.text = value.name
            subtitleLabel.text = value.type
        }
    }
}
