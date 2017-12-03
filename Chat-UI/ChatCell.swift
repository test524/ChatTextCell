//
//  ChatCell.swift
//  Chat-UI
//
//  Created by Pavan Kumar Reddy on 23/04/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleViewRightAnchor: NSLayoutConstraint?
    var bubbleViewLeftAnchor: NSLayoutConstraint?

    override init(frame:CGRect)
    {
        super.init(frame: frame)
        backgroundColor  = UIColor.white
        
        addSubview(cellBubleView)
        addSubview(cellTextView)
        addSubview(profileImageView)
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        bubbleViewRightAnchor = cellBubleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        bubbleViewRightAnchor?.isActive = true
        
        bubbleViewLeftAnchor = cellBubleView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8)
        
        cellBubleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        cellBubleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        bubbleWidthAnchor = cellBubleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
        
        
        cellTextView.leftAnchor.constraint(equalTo: cellBubleView.leftAnchor, constant: 4).isActive = true
        cellTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellTextView.rightAnchor.constraint(equalTo: cellBubleView.rightAnchor,constant: -4
            ).isActive = true
        cellTextView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder)  {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellBubleView:UIView =  {
        let bview = UIView()
        bview.backgroundColor = blueColor
        bview.translatesAutoresizingMaskIntoConstraints = false
        bview.layer.cornerRadius = 16
        bview.layer.masksToBounds = true
        return bview
    }()
    
    //UIFont.init(name: "Apple Color Emoji", size: 30)
    
    let cellTextView:UITextView = {
        let tView = UITextView()
        tView.backgroundColor = UIColor.clear
        tView.textColor = UIColor.white
        tView.dataDetectorTypes = .all
        tView.font =  UIFont.systemFont(ofSize: 16)
        tView.text = "Sample text,Sample text,Sample text,Sample text,Sample text,Sample text,Sample text,Sample text,Sample text,Sample text"
        tView.isEditable = false
        tView.isScrollEnabled = false
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "78")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
}
