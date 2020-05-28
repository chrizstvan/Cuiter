//
//  TweetCell.swift
//  Cuiter
//
//  Created by Chris Stev on 27/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributeText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = " \(tweet.user.username)\n"
            attributeText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            //give paragraph style
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributeText.string.count)
            attributeText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: range)
            
            attributeText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
                        
            messageTextView.attributedText = attributeText
        }
    }
    
    let messageTextView: UITextView = {
       let tv = UITextView()
        tv.text = "HAVE SAMPLE TEXT"
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myprofilepic")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5.0
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
