//
//  LoginPageViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 12/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

// 로그인 페이지
class LoginPageViewController: UIViewController, UITextFieldDelegate {

    var userModel = UserModel() // 구조체 불러오기
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // 로그인 버튼 눌렸을 때
    @IBAction func tabLoginButton(_ sender: UIButton) {
        // 아이디, 패스워드 nil값 아닌지 확인
        guard let userId = idTextField.text, !userId.isEmpty else {return}
        guard let userPw = pwTextField.text, !userPw.isEmpty else {return}
        
        // 유저인지 확인
        let logInSuccess:Bool = userModel.isInUser(id: userId, pw: userPw)
        if logInSuccess {
            // 맞으면 로그인 성공 뷰컨트롤러로 이동하기
            self.performSegue(withIdentifier: "loginSuccess", sender: self)
//            let success = LoginSuccessViewController()
//            self.present(success, animated: true, completion: nil)
        } else {
            // 아니라면 레이블에 글씨 띄우기
            loginLabel.text = "로그인 실패!"
//            let success = LoginSuccessViewController()
//            self.present(success, animated: false, completion: nil)
        }
    }
    
    // TextField 사용 시 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // 프리페어로 미리 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? JoinPageViewController {
            // 화면 전환 시 클로저 담아서 보내기
            dest.didTaskClosure = {
                // 회원가입 뷰컨트롤러에 배열, 구조체 정보 보내기
                (userid: String, userpw:String) -> Void in return
                self.userModel.appendUser(id: userid, pw: userpw)
            }
        }
        
        // 로그인 성공시
        if segue.identifier == "loginSuccess" {
            let destLS = segue.destination as! LoginInfoViewController
            
            let loginId:String! = idTextField.text
            
            // 레이블에 들어갈 말 전달하기
            var outString: String = loginId
            outString += "님, 환영합니다!"
            destLS.info = outString
        }
    }
}
