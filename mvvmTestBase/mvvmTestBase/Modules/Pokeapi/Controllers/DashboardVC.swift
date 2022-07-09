//
//  DashboardVC.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import UIKit
// MARK: The view layer has two important tasks, presenting data to the user and handling user interaction. A core principle of the MVC pattern is the view layer's ignorance with respect to the model layer. Views are dumb objects. They only know how to present data to the user. They don't know or understand what they are presenting.

// MARK: Solo maneja cosas relacionadas a UI. Mostrar y obtener información.
/// Clase que administra las acciones desde que se crea o llama a la vista. También se encarga de la comunicación entre la vista y el presenter.
final class DashboardVC: UIViewController {
    /// Tabla que muestra el listado de movimientos
    @IBOutlet fileprivate weak var tvDashboard: UITableView!
    lazy var dashboardViewModel = {
        DashboardViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon"
        setUpDataCell()
        initViewModel()
        self.tvDashboard.reloadData()
    }
    /// Función que inicializa los componentes de la tabla.
    private func setUpDataCell() {
        self.tvDashboard.delegate = self
        self.tvDashboard.dataSource = self
        self.tvDashboard.register(UINib(nibName: "DashboardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DashboardTableViewCell")
        self.tvDashboard.tableFooterView = UIView()
    }
    /// Actualizaci´pon de información de tablas
    private func initViewModel() {
        dashboardViewModel.getPokemonData()
        dashboardViewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tvDashboard.reloadData()
            }
        }
    }
}
extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    /// Función que define la cantidad de celdas de cada sección.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dashboardViewModel.pokemons?.count ?? 0
    }
    /// Función que define el contenido de cada celda dependiendo de la sección.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tvDashboard.dequeueReusableCell(withIdentifier: "DashboardTableViewCell") as? DashboardTableViewCell {
            if let element = dashboardViewModel.pokemons?[indexPath.row] {
                cell.configure(data: element)
                return cell
            }
        }
        return UITableViewCell()
    }
    /// Función que define la acción a realizar en caso de ser seleccionada una celda.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let element = dashboardViewModel.pokemons?[indexPath.row] {
            let detailVC = DetailVC()
            detailVC.detailViewModel = DetailViewModel(pokemon: element)
            present(detailVC, animated: true, completion: nil)
        }
        tvDashboard.deselectRow(at: indexPath, animated: true)
    }
}
