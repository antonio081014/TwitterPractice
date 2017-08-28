//
//  BaseCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/28/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}
