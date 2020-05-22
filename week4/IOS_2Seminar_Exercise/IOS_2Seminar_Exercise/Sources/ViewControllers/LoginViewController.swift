//
//  LoginViewController.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/16.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { // 미리 정의해 둔 싱글톤 객체를 통해서 데이터 통신
            
            networkResult in switch networkResult { // LoginService싱글톤 객체의 login 함수에 클로져함수를 통해 받아온 networkResult
                
            case .success(let token): // 데이터 통신 성공시 탭바로 되어있는 메인화면 present
                
                //토큰 받아오기
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                
                // 탭바 컨트롤러로 넘어가는 것
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "TabBarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message): // 에러가 났을 때 알림창 뜨도록 구현
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil) // 캔슬은 알림창에 하나만 들어갈 수 있음
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        } // 통신 결과에 따라 분기 처리
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
