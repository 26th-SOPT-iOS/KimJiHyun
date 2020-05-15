# KimJiHyun
김지현

## 3주차 세미나

1️⃣ **친구 테이블뷰 목록 구현**

> 1. HeaderCell (내 프로필), FriendsCell .swift 파일을 만들어서 각 셀의 이미지, 라벨의 아울렛 연결 후 image와 text를 받아올 함수 구현 (생략)
> 2. FriendsViewController(UIViewController)에서 extension 으로 UITableViewDataSource, UITableViewDelegate 함수 추가
> 3. DataInformation 파일에서 구조 만든 후, FriendsViewController에서 친구들 정보 추가 (생략)

### FriendsViewController - UITableViewDataSource
```{.swift}
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
```{.swift}
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
> 처음엔 headerView에 구분선과 친구 20 을 헤더뷰에 넣었다가, 헤더뷰 특징 상 아래로 내리면 헤더뷰만 위에 남아있게 되는데, 시간이 부족해서 남아있지 않게 구현하는 것을 못해서 footerView에 구분선과 친구 20을 추가했습니다 ㅜㅜ 내일 스터디 시간에 시도해야겠어요~~
> *구분선을 포토샵으로 만들어 넣어야 하나 했는데, UIView의 높이를 0.5로 작게 해서 선처럼 넣는 방법이 신기했어요* 🤭
