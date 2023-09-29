//
//  RegisterViewController.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class RegisterViewController: UIViewController,RegisterViewProtocol {
    

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
  
    
    func showToastWith(messageStr: String) {
        print("")
    }
    
    func viewRegisterSuccess(messageStr: String, RegisterData: RegisterResponse) {
        print("")
    }
    

    var presenter: RegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        presenter?.presentingRegisterApi(input: RegisterInput(full_name: fullname.text,phone: phoneNumberText.text,email:email.text))
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
