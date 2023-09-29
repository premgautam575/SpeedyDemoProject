//
//  LoginPresenter.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    func postRequest(input: LoginInput) {
        interactor?.interactorpostRequest(input: input)
    }
    
    func interactorLoginSuccess(messageStr: String, LoginData: LoginResponse) {
        view?.showToastWith(messageStr: messageStr)
        view?.viewLoginSuccess(messageStr: messageStr, LoginData: LoginData)
    }
    
    func didFinishedRequestWithFailure(failureError: Error) {
        view?.showToastWith(messageStr: failureError.localizedDescription)
    }
    
    func presentingLoginApi(input: LoginInput) {
        interactor?.interactorLoginApi(input: input)
    }
    
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
