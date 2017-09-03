//
//  ViewController.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/22/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var users: [User]?
    var tweets: [Tweet]?
    
    private let cellID = "cellID"
    private let headerID = "headerID"
    private let footerID = "footerID"
    private let cell2ID = "cell2ID"
    
    private let imageSize: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor(red: 232/255, green: 235/255, blue: 241/255, alpha: 1)
        self.collectionView?.register(UserCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: cell2ID)
        self.collectionView?.register(UserHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        self.collectionView?.register(UserFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerID)
        
        self.setupNavigationBarItems()
        
        Service.shared.fetchHomeFeed { (users, tweets) in
            self.users = users
            self.tweets = tweets
            self.collectionView?.reloadData()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return self.tweets?.count ?? 0
        default:
            return self.users?.count ?? 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell2ID, for: indexPath) as! TweetCell
            cell.tweet = self.tweets?[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! UserCell
        cell.user = self.users?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let user = self.users?[indexPath.item]
            let bioSize = NSString(string: user?.bio ?? "").boundingRect(with: CGSize(width: self.view.bounds.width - 12 - 50 - 12 - 2, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)], context: nil)
            return CGSize(width: self.view.bounds.width, height: 52 + 4 + 10 + bioSize.height)
        default:
            return CGSize(width: self.view.bounds.width, height: 150)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! UserFooter
            return footerView
        } else if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! UserHeader
            return headerView
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 64)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// Navigation View Setup.
extension HomeViewController {
    func setupNavigationBarItems() {
        self.setupLeftNavigationItems()
        self.setupRightNavigationItems()
        self.setupRemainingNavigationItems()
    }
    
    private func setupRightNavigationItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
    private func setupLeftNavigationItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRemainingNavigationItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        
        // Replace black line under navigationbar.
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarBackgroundView = UIView()
        navBarBackgroundView.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        navBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navBarBackgroundView)
        navBarBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        navBarBackgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        navBarBackgroundView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        navBarBackgroundView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}
