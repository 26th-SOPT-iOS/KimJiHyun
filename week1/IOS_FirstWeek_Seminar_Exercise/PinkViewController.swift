//
//  PinkViewController.swift
//  IOS_FirstWeek_Seminar_Exercise
//
//  Created by 김지현 on 18/04/2020.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController { // IBAction으로 화면 전환

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
