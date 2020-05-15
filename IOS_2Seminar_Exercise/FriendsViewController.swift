//
//  FriendsViewController.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/14.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    
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
    
    
    private var dataInformations: [DataInformation] = []
    
    private func setdataInformations() {
        let data1 = DataInformation(name: "가솝트", message: "왈왈!", imageName: "profile1Img")
        let data2 = DataInformation(name: "나솝트", message: "왈왈!", imageName: "profile2Img")
        let data3 = DataInformation(name: "다솝트", message: "왈왈!", imageName: "profile3Img")
        let data4 = DataInformation(name: "라솝트", message: "왈왈!", imageName: "profile4Img")
        let data5 = DataInformation(name: "마솝트", message: "왈왈!", imageName: "profile5Img")
        let data6 = DataInformation(name: "바솝트", message: "왈왈!", imageName: "profile6Img")
        let data7 = DataInformation(name: "사솝트", message: "왈왈!", imageName: "profile7Img")
        let data8 = DataInformation(name: "아솝트", message: "왈왈!", imageName: "profile8Img")
        let data9 = DataInformation(name: "자솝트", message: "왈왈!", imageName: "profile9Img")
        let data10 = DataInformation(name: "차솝트", message: "왈왈!", imageName: "profile1Img")
        let data11 = DataInformation(name: "카솝트", message: "왈왈!", imageName: "profile2Img")
        let data12 = DataInformation(name: "타솝트", message: "왈왈!", imageName: "profile3Img")
        let data13 = DataInformation(name: "파솝트", message: "왈왈!", imageName: "profile4Img")
        let data14 = DataInformation(name: "하솝트", message: "왈왈!", imageName: "profile5Img")
        let data15 = DataInformation(name: "가솝트", message: "왈왈!", imageName: "profile6Img")
        let data16 = DataInformation(name: "나솝트", message: "왈왈!", imageName: "profile7Img")
        let data17 = DataInformation(name: "다솝트", message: "왈왈!", imageName: "profile8Img")
        let data18 = DataInformation(name: "라솝트", message: "왈왈!", imageName: "profile9Img")
        let data19 = DataInformation(name: "마솝트", message: "왈왈!", imageName: "profile1Img")
        let data20 = DataInformation(name: "바솝트", message: "왈왈!", imageName: "profile2Img")
    
    dataInformations = [data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20] }
    

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
}

extension FriendsViewController: UITableViewDataSource {
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
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 86
        default:
            return 62
        }
        // 셀의 높이 코드로 지정
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
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
}
