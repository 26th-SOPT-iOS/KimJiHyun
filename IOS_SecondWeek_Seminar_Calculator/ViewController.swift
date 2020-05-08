//
//  ViewController.swift
//  IOS_SecondWeek_Seminar_Calculator
//
//  Created by 김지현 on 08/05/2020.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionOfButtons?.forEach({
            $0.layer.cornerRadius = 45.0
        })
    }


}

