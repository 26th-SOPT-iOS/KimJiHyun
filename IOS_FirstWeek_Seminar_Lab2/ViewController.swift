//
//  ViewController.swift
//  IOS_FirstWeek_Seminar_Lab2
//
//  Created by 김지현 on 18/04/2020.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    
    @IBAction func loginClick(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "loginView") as? LoginViewController else {return}
        
        self.present(nextVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 10.0
        signupButton.layer.cornerRadius = 10.0
    }


}

