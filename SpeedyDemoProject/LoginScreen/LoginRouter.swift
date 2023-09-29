//
//  LoginRouter.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class LoginRouter: LoginWireframeProtocol {
    
    weak var viewController: UIViewController?
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view as! LoginViewProtocol, interactor: interactor, router: router)
       
        view.presenter = presenter as! any LoginPresenterProtocol
        interactor.presenter = presenter as any LoginInteractorOutputProtocol
        router.viewController = view
        return view
    }
}
