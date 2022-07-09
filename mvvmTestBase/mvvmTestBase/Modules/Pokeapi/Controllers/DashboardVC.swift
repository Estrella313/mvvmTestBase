//
//  DashboardVC.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import UIKit

class DashboardVC: UIViewController {
    /// Tabla que muestra el listado de movimientos
    @IBOutlet fileprivate weak var tvDashboard: UITableView!
    
    private var pokedexViewModel: PokedexViewModel = PokedexViewModel()
    private var networkManager: NetworkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon"
        setUpDataCell()
        getPokemonData()
    }
    /// Función que inicializa los componentes de la tabla.
    private func setUpDataCell() {
        self.tvDashboard.delegate = self
        self.tvDashboard.dataSource = self
        self.tvDashboard.register(UINib(nibName: "DashboardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DashboardTableViewCell")
        self.tvDashboard.tableFooterView = UIView()
    }
    
     /// Función que llama al servicio y obtiene su respuesta
    private func getPokemonData() {
        self.networkManager.getPokemons { success, pokemonData, error in
            if success, let pokemonData = pokemonData {
                self.pokedexViewModel.pokemons = pokemonData
                DispatchQueue.main.async {
                    self.tvDashboard.reloadData()
                }
            } else {
                print(error ?? "Ups algo salio mal")
            }
        }
    }
}
extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    /// Función que define la cantidad de celdas de cada sección.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokedexViewModel.numberOfRows(section)
    }
    /// Función que define el contenido de cada celda dependiendo de la sección.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tvDashboard.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemonVM = pokedexViewModel.modelAt(indexPath.row)
        cell.configure(pokemon: pokemonVM)
        
        return cell
    }
    /// Función que define la acción a realizar en caso de ser seleccionada una celda.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedVM = pokedexViewModel.modelAt(indexPath.row)
        let detailVC = DetailVC()
        detailVC.pokemonViewModel = selectedVM
        present(detailVC, animated: true, completion: nil)
        
        tvDashboard.deselectRow(at: indexPath, animated: true)
    }
}
