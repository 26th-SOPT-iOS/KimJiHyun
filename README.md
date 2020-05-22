# KimJiHyun
김지현

## 3주차 세미나

1️⃣ **친구 테이블뷰 목록 구현**

> 1. HeaderCell (내 프로필), FriendsCell .swift 파일을 만들어서 각 셀의 이미지, 라벨의 아울렛 연결 후 image와 text를 받아올 함수 구현 (생략)
> 2. FriendsViewController(UIViewController)에서 extension 으로 UITableViewDataSource, UITableViewDelegate 함수 추가
> 3. DataInformation 파일에서 구조 만든 후, FriendsViewController에서 친구들 정보 추가 (생략)

### FriendsViewController - UITableViewDataSource
```swift
func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return dataInformations.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for:
            indexPath) as? HeaderCell
            else { return UITableViewCell() }
            
            headerCell.setDataInformation(name: "김지현",
            message: "아요^0^", imageName: "profile7Img")
            
            return headerCell
            
        default:
            guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for:
            indexPath) as? FriendsCell
            else { return UITableViewCell() }
            
            friendsCell.setDataInformation(name: dataInformations[indexPath.row].name,
            message: dataInformations[indexPath.row].message, imageName: dataInformations[indexPath.row].imageName)
            
            return friendsCell
        }
    }
```

### FriendsViewController - UITableViewDelegate
```swift
let footerView = UIView()
        let friendNumLabel = UILabel()
        
        if section == 0 {
            let separatorView = UIView(frame: CGRect(x: 15.5, y: 0, width: 345, height: 0.5))
            separatorView.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
            
            friendNumLabel.text = "친구 \(dataInformations.count)"
            friendNumLabel.font = UIFont.systemFont(ofSize: 11)
            friendNumLabel.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
            friendNumLabel.frame = CGRect.init(x: 16, y: 9.5, width: 60, height: 17)
            
            footerView.backgroundColor = UIColor.white
            footerView.addSubview(separatorView)
            footerView.addSubview(friendNumLabel)
        }
        return footerView
    }
```
> 처음엔 headerView에 구분선과 친구 20 을 헤더뷰에 넣었다가, 헤더뷰 특징 상 아래로 내리면 헤더뷰만 위에 남아있게 되는데, 남아있지 않게 구현하는 것을 아직 못해서 footerView에 구분선과 친구 20을 추가했다 ㅜㅜ

> *구분선을 포토샵으로 만들어 넣어야 하나 했는데, UIView의 높이를 0.5로 작게 해서 선처럼 넣는 방법이 신기했다* 🤭

2️⃣ **도전과제 : 친구목록 삭제 기능**

> UITableViewDelegate 함수 중 canEditRowAt이 포함된 함수 -> row를 수정 가능하게 함 / HeaderCell은 내 프로필이므로 수정 불가하게 했다
> UITableViewDelegate 함수 중 commit editingStyle 이 포함된 함수 -> editingStyle 이 delete이며, section이 1이라면(친구목록셀) 삭제
```swift
func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case 0:
            return false
        default:
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section == 1 {
            dataInformations.remove(at: indexPath.row)
            friendsTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
```

3️⃣ **도전과제 : 네비게이션바아이템 actionsheet**

> FriendsViewController에 바버튼아이템 액션을 연결해주어 UIAlertController가 뜨도록 함
```swift
@IBAction func settingItem(_ sender: UIBarButtonItem) {
        let optionMenu = UIAlertController()
            
        let deleteAction = UIAlertAction(title: "친구 관리", style: .default)
        let saveAction = UIAlertAction(title: "전체 설정", style: .default)
            
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
            
        self.present(optionMenu, animated: true, completion: nil)
    }
```

4️⃣ **그 외**

> **AppDelegate에서 탭바 tintColor 지정**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().tintColor = UIColor(red: 47/255, green: 54/255, blue: 62/255, alpha: 1)
        return true
    }
```

> **ViewDidLoad**
> 1. setdataInformations() 호출
> 2. datasource, delegate 대리자 위임
> 3. row간의 separator 없애기
> 4. 네비게이션바 설정
``` swift
override func viewDidLoad() {
        super.viewDidLoad()
        setdataInformations()
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.separatorStyle = FriendsCell.SeparatorStyle.none
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
```

> **탭바, 네비게이션 Embed In**

> *궁금한 점, 추가*

> + shadowImage
> + 네비게이션 바버튼 아이템 font 수정...
> + UIViewController 에 dataSource, delegate 대리자 위임 방법 말고 TableViewController로 구현
> + cell style -> RightDetail로

## 4주차 세미나

1️⃣ **회원가입 구현**

> 1. APIConstants.swift - API 주소 모아놓는 곳
### APIConstants.swift
```swift
import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
```

> 2. SigninData.swift - 로그인 JSON 데이터
> TokenData struct가 따로 있는 이유 -> 존재하지 않는 아이디이거나 비밀번호를 틀렸을 때엔 token이 없기 때문에 data 의 key값(토큰)이 있을 때와 없을 때를 구분해주기 위해
### SigninData.swift
```swift
struct SigninData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: TokenData?
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
    
}

struct TokenData: Codable {
    var jwt: String
}
```

> 3. NetworkResult.swift -> 서버 통신에 따른 결과

> 4. LoginService.swift -> 로그인 서버 통신 구현
> 5. SignUpService.swift -> 회원가입 서버 통신 구현
### LoginService.swift, SignUpService.swift
```swift
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data) // 200일 땐 함수 사용해서 분기처리 두 번
        case 400: return .pathErr
        case 500: return .serverErr default: return .networkFail }
    }
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SigninData.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        return .success(tokenData.jwt)
    }
```
> 처음엔 case 200일 때 requestErr (이미 있는 아이디 등등의 에러)를 하고 204일 때 isSignUp을 호출했지만

> 아직 decode 전이어서 requestErr, success 모두 200이었다 (지윤언니가 알려줌 ㅜㅜ)

> 그래서 우선 200일 때 isSignUp을 호출해서 decode success 여부에 따라 success와 requestErr를 나눠줌
```swift
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        //case 200: return .requestErr(true)
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
```

### 싱글톤 객체 in SignUpService.swift
```swift
static let shared = SignUpService()
```
### 가입하기 버튼 구현부에서 쓰인 싱글톤 패턴
```swift
SignUpService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, pNum: inputNUM) { //뒤 생략
```

> 6. SignUpData.swift
> 회원가입 시엔 토큰 값이 필요없으므로 datad와 struct TokenData를 빼줌
> 7. LoginViewController.swift - 생략
> 8. JoinViewController.sift
> success 시 다시 로그이 창을 되돌아감
```swift
            case .success: // 데이터 통신 성공시 탭바로 되어있는 메인화면 present
                print("success")
                self.navigationController?.popViewController(animated: true)
```
