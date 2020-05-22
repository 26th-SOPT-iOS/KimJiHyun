//
//  NetWorkResult.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/16.
//  Copyright © 2020 김지현. All rights reserved.
//

import Foundation

enum NetworkResult<T> { // 분기처리
    // 서버 통신 결과
    case success(T) //성공
    case requestErr(T) //요청에러
    case pathErr //경로에러
    case serverErr //서버내부에러
    case networkFail //네트워크연결에러
}
