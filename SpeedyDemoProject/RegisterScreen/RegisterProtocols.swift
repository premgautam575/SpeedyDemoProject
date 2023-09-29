//
//  RegisterProtocols.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//
import Foundation

//MARK: Wireframe -
protocol RegisterWireframeProtocol: class {
    
}
//MARK: Presenter -
protocol RegisterPresenterProtocol: class {
    var interactor: RegisterInteractorInputProtocol? { get set }
    func presentingRegisterApi(input:RegisterInput)
    func RegisterRequest(input: RegisterInput)
}

//MARK: Interactor -
protocol RegisterInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
    func interactorRegisterSuccess(messageStr:String,RegisterData:RegisterResponse)
    func didFinishedRequestWithFailure(failureError: Error)
}

protocol RegisterInteractorInputProtocol: class {
    var presenter: RegisterInteractorOutputProtocol?  { get set }
    func interactorRegisterApi(input:RegisterInput)
    func interactorRegisterRequest(input: RegisterInput)
    /* Presenter -> Interactor */
}

//MARK: View -
protocol RegisterViewProtocol: class {
    var presenter: RegisterPresenterProtocol?  { get set }
    func showToastWith(messageStr:String)
    func viewRegisterSuccess(messageStr:String,RegisterData:RegisterResponse)
    /* Presenter -> ViewController */
}
