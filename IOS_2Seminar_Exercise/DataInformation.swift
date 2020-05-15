//
//  DataInformation.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/13.
//  Copyright © 2020 김지현. All rights reserved.
//

import Foundation

struct DataInformation {
    var name: String
    var message: String
    var imageName: String
    init(name: String, message: String, imageName: String) {
        self.name = name
        self.message = message
        self.imageName = imageName
    }
}
