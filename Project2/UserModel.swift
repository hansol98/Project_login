//
//  UserModel.swift
//  Project2
//
//  Created by SWUCOMPUTER on 12/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import Foundation
final class UserModel {
    // 모델 구조체 만듬 다른 뷰컨트롤러에서 이용할 수 있도록
    struct UserInfo {
        var userId: String
        var userPW: String
    }
    
    // 사용자 아이디, 비밀번호 저장 배열
    var model: [UserInfo] = [
    UserInfo(userId: "user01", userPW: "1234")
    ]
    
    // 사용자가 있는지 검색
    func isInUser(id:String, pw:String) -> Bool {
        for user in model{
            if user.userId == id || user.userPW == pw {
                return true
            }
        }
        return false
    }
    
    // 새로운 사용자 추가
    func appendUser(id:String, pw:String){
        let new = UserInfo(userId: id, userPW: pw)
        model.append(new)
    }
}
