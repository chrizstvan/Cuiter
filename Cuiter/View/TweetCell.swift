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
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
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
        tv.backgroundColor = .clear
        return tv
    }()
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = UIImage(named: "myprofilepic")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5.0
        return imageView
    }()
    
    let replayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    let directMessButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        //addSubview(replayButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //replayButton.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        setupBottomButton()
    }
    
    func setupBottomButton() {
        let buttonStackView = UIStackView(arrangedSubviews: [replayButton, retweetButton, likeButton, directMessButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
}
