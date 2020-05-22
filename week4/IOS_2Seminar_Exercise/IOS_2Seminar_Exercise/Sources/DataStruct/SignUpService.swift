//
//  SignUpService.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/16.
//  Copyright © 2020 김지현. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService() // 싱글톤 객체로 앱 어디서든 접근
    
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ pNum: String) -> Parameters { // Request Body 에 들어갈 변수들
        return ["id": id, "password": pwd, "name":name, "email":email, "phone":pNum]
    }
    
    func signup(id: String, pwd: String, name: String, email: String, pNum: String, completion: @escaping (NetworkResult<Any>) -> Void) { // Request Header
        let header: HTTPHeaders = ["Content-Type": "application/json"] // HTTPHeaders는 Alamofire에 있는 참조변수, HTTPHeaders.token:~
        
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd, name, email, pNum), encoding: JSONEncoding.default, headers: header) // 원하는 형식의 Request 생성
        
        dataRequest.responseData { dataResponse in switch dataResponse.result { // 데이터 통신 시작
        case .success:
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let value = dataResponse.result.value else { return }
            let networkResult = self.judge(by: statusCode, value)
            completion(networkResult)
        case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        //case 200: return .requestErr(true) // 200일 땐 함수 사용해서 분기처리 두 번
        case 200: return isSignUp(by: data)
        case 400: return .pathErr
        case 500: return .serverErr default: return .networkFail }
    }
    
    private func isSignUp(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data)
            else {
                return .pathErr }
        
        if decodedData.success{
            return .success(data)
        }
        else {
            return .requestErr(decodedData.message)
        }
    }
}
