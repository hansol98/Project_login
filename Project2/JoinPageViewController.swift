//
//  JoinPageViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 11/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class JoinPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var perpicker: UIPickerView!
    @IBOutlet var infoLabel: UILabel!
    
    // 로그인 페이지에서 넘어올 클로저 받을 변수
    var didTaskClosure: ((String, String) -> Void)? = nil
    
    // 텍스트필드 사용 시 키보드 내리는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // 커스텀 피커에 들어갈 내용
    let yearArray: Array<String> = ["1학년", "2학년", "3학년", "4학년"]
    let depArray: Array<String> = ["경영학과", "디지털미디어학과", "산업디자인학과", "소프트웨어융합학과","정보보호학과", "패션산업학과"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 회원가입하기 버튼 눌렀을 때
    @IBAction func tabJoin(_ sender: UIButton) {
        let userId = idTextField.text
        let userPw = pwTextField.text
        
        // nil이 아닌지 확인
        if ((userId?.isEmpty)! || (userPw?.isEmpty)!) {
            infoLabel.text = "아이디와 비밀번호를 입력해주세요."
        } else {
            // 아니면 변수에 아이디와 패스워드 담기
            didTaskClosure?(userId!, userPw!)
            dismiss(animated: true, completion: nil)    // 모달 내리기
        }
    }
    
    // 로그인하러가기 버튼눌렀을 때
    @IBAction func tabToLoginButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)    // 모달 내리기
    }
    
    // 커스텀 피커에서의 컴포넌트 수 : 두 줄 ==> 2
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 커스텀 피커의 선택 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            // 첫 번째 줄 : 배열에 들어있는 학년의 개수
            return yearArray.count
        } else {
            // 두 번째 줄 : 배열에 들어있는 학과의 개수
            return depArray.count
        }
    }
    
    // 커스텀피커 내용
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 배열 안에 있는 내용 출력
        if component == 0 {
            return yearArray[row]
        } else {
            return depArray[row]
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

}
