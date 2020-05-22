//
//  JoinViewController.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/16.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        guard let inputNAME = nameTextField.text else { return }
        guard let inputEMAIL = emailTextField.text else { return }
        guard let inputNUM = numTextField.text else { return }
        
        SignUpService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, pNum: inputNUM) { // 미리 정의해 둔 싱글톤 객체를 통해서 데이터 통신
            
            networkResult in switch networkResult { // LoginService싱글톤 객체의 login 함수에 클로져함수를 통해 받아온 networkResult
                
            case .success: // 데이터 통신 성공시 탭바로 되어있는 메인화면 present
                print("success")
                self.navigationController?.popViewController(animated: true)
                
            case .requestErr(let message): // 에러가 났을 때 알림창 뜨도록 구현
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil) // 캔슬은 알림창에 하나만 들어갈 수 있음
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
