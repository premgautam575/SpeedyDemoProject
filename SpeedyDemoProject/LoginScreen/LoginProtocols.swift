//
//  LoginProtocols.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {
    
}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {
    var interactor: LoginInteractorInputProtocol? { get set }
    func presentingLoginApi(input:LoginInput)
    func postRequest(input: LoginInput)
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
    func interactorLoginSuccess(messageStr:String,LoginData:LoginResponse)
    func didFinishedRequestWithFailure(failureError: Error)
}

protocol LoginInteractorInputProtocol: class {
    var presenter: LoginInteractorOutputProtocol?  { get set }
    func interactorLoginApi(input:LoginInput)
    func interactorpostRequest(input: LoginInput)
    /* Presenter -> Interactor */
}

//MARK: View -
protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol?  { get set }
    func showToastWith(messageStr:String)
    func viewLoginSuccess(messageStr:String,LoginData:LoginResponse)
    /* Presenter -> ViewController */
}


