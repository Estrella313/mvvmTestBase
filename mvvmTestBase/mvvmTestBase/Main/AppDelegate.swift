//
//  AppDelegate.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 22/06/22.
//
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// Variable que define la pantalla principal.
    var window: UIWindow?
    /// Variable para actualizar la vista de una vista.
    var viewController: UIViewController?
    /// Variable para hacer referencia a la barra de navegación y modificar su apariencia e indicar la vista principal.
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// Variable con la primera vista que se mostrará al iniciar la aplicación.
        let firstView: DashboardVC = DashboardVC()
        navigationController = UINavigationController(rootViewController: firstView)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}
