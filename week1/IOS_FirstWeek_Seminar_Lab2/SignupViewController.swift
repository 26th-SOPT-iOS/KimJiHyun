//
//  SignupViewController.swift
//  IOS_FirstWeek_Seminar_Lab2
//
//  Created by 김지현 on 24/04/2020.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    @IBAction func signupClick(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "loginView") as? LoginViewController else {return}
        
        self.present(nextVC, animated: true, completion: {
              if let nav = self.navigationController {
                  nav.popViewController(animated: true)
              }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
