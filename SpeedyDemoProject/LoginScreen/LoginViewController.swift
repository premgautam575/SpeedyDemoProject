//
//  LoginViewController.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class LoginViewController: UIViewController,LoginViewProtocol, UITextFieldDelegate {
    func showToastWith(messageStr: String) {
        print("")
    }
    
    func viewLoginSuccess(messageStr: String, LoginData: LoginResponse) {
        print("")
    }
    
    @IBOutlet weak var PhoneNumberText: UITextField!
    
    
    var presenter : LoginPresenterProtocol?

    private func textFieldShouldReturn(textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        view.endEditing(true)
         return true
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PhoneNumberText.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func continueBtn(_ sender: Any) {
        presenter?.postRequest(input: LoginInput(phone: PhoneNumberText.text))
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
