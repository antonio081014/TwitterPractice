//
//  User.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/28/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let bio: String
    let profileImageUrl: String
}
