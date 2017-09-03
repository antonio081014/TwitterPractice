//
//  Tweet.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 9/1/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import Foundation

struct Tweet: Decodable {
    let user: User
    let image: Image
    let message: String
}
