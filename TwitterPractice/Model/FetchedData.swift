//
//  FetchedData.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 9/3/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import Foundation
struct FetchedData: Decodable {
    let users: [User]
    let tweets: [Tweet]
}
