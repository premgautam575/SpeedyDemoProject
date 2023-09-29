//
//  RegisterPresenter.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//


import UIKit

class RegisterPresenter: RegisterPresenterProtocol, RegisterInteractorOutputProtocol {
    func RegisterRequest(input: RegisterInput) {
        interactor?.interactorRegisterRequest(input: input)
    }
    
    func interactorRegisterSuccess(messageStr: String, RegisterData: RegisterResponse) {
        view?.showToastWith(messageStr: messageStr)
        view?.viewRegisterSuccess(messageStr: messageStr, RegisterData: RegisterData)
    }
    
    func didFinishedRequestWithFailure(failureError: Error) {
        view?.showToastWith(messageStr: failureError.localizedDescription)
    }
    
    func presentingRegisterApi(input: RegisterInput) {
        interactor?.interactorRegisterApi(input: input)
    }
    
    weak private var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    private let router: RegisterWireframeProtocol

    init(interface: RegisterViewProtocol, interactor: RegisterInteractorInputProtocol?, router: RegisterWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
