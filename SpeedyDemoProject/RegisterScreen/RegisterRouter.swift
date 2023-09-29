//
//  RegisterRouter.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class RegisterRouter: RegisterWireframeProtocol {
    
    weak var viewController: UIViewController?
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = RegisterViewController(nibName: nil, bundle: nil)
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interface: view as! RegisterViewProtocol, interactor: interactor, router: router)
       
        view.presenter = presenter as! any RegisterPresenterProtocol
        interactor.presenter = presenter as any RegisterInteractorOutputProtocol
        router.viewController = view
        return view
    }
}
