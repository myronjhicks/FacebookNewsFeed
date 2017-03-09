//
//  FeedController.swift
//  FacebookNewsFeed
//
//  Created by myron hicks on 3/9/17.
//  Copyright © 2017 myron hicks. All rights reserved.
//

import UIKit

class FeedController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "FeedCell"
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPosts()
        
        navigationItem.title = "Facebook Feed"
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight : CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24)
        }
        
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func setupPosts() {
        let post1 = Post()
        post1.name = "Myron"
        post1.statusText = "Jordyn, just being Jordyn."
        post1.profileImageName = "headshot"
        post1.statusImageName = "jordyn"
        post1.numLikes = 12000
        post1.numComments = 10000
        
        let post2 = Post()
        post2.name = "Michelle Hicks"
        post2.statusText = "One of the greatest titles in the world is parent, and one of the biggest blessings in the world is to have parents to call mom and dad."
        post2.profileImageName = "michelle_image"
        post2.statusImageName = "jordyn"
        post2.numLikes = 8000
        post2.numComments = 1000
        
        let post3 = Post()
        post3.name = "Steve Jobs"
        post3.statusText = "When you’re a carpenter making a beautiful chest of drawers, you’re not going to use a piece of plywood on the back, even though it faces the wall and nobody will see it. You’ll know it’s there, so you’re going to use a beautiful piece of wood on the back. For you to sleep well at night, the aesthetic, the quality, has to be carried all the way through."
        post3.profileImageName = "steve_profile"
        post3.statusImageName = "steve_status"
        post3.numLikes = 223000
        post3.numComments = 100
        
        let post4 = Post()
        post4.name = "Gandhi"
        post4.statusText = "Your beliefs become your thoughts,\n" +
            "Your thoughts become your words,\n" +
            "Your words become your actions,\n" +
            "Your actions become your habits,\n" +
            "Your habits become your values,\n" +
        "Your values become your destiny."
        post4.profileImageName = "gandhi"
        post4.statusImageName = "gandhi_status"
        post4.numLikes = 500
        post4.numComments = 47
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        
    }
    
}
