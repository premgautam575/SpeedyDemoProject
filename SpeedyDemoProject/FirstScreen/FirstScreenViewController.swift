//
//  FirstScreenViewController.swift
//  SpeedyDemoProject
//
//  Created by prem  on 28/09/23.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func loginBtn(_ sender: Any) {
        let controller = LoginRouter.createModule()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
        let controller = RegisterRouter.createModule()
        self.navigationController?.pushViewController(controller, animated: true)
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
