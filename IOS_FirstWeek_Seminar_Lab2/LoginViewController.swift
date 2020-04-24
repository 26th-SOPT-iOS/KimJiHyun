//
//  LoginViewController.swift
//  IOS_FirstWeek_Seminar_Lab2
//
//  Created by 김지현 on 18/04/2020.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    @IBAction func logoutClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
