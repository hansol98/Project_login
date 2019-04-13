//
//  LoginSuccessViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 13/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

// 로그인 성공 시, 모달로 띄a운 ViewController로 이동
class LoginInfoViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
//    @IBOutlet var exitButton: UIButton!
//
    var info: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewController에 있는 label에 로그인 뷰컨트롤러에서 받아온 프리페어를 미리 준비
        if let contentString = info {
            infoLabel.text = contentString
        }
        // Do any additional setup after loading the view.
    }
    
    // 창 닫기 버튼 누르면 모달을 내림
    @IBAction func downModalToExit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
