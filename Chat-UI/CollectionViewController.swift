//
//  CollectionViewController.swift
//  Chat-UI
//
//  Created by Pavan Kumar Reddy on 22/04/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout
{

    var megArray = ["Sampletext","SampletextSampletext"]
    
    var meg: NSMutableArray!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView?.contentInset = UIEdgeInsetsMake(20, 0, 2, 0)
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.keyboardDismissMode = .interactive
        self.collectionView!.register(ChatCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupKeyboardObservers()
        //megArray.enumerated()
    }

   lazy var loadData:NSMutableArray =  {
       
        let meg = NSMutableArray()
        for (k,value) in self.megArray.enumerated()
        {
            let dic = ["send":value]
            meg.add(dic)
        }
        return meg
    }()
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return loadData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChatCell
        
        let text = loadData[indexPath.row] as? [String:String]
        if let str = text?["send"]
        {
        cell.cellTextView.text = str
        cell.profileImageView.isHidden = true
            
        cell.bubbleViewRightAnchor?.isActive = true
        cell.bubbleViewLeftAnchor?.isActive = false
            
        cell.cellBubleView.backgroundColor = blueColor
        cell.cellTextView.textColor = UIColor.white

        }
        else if let str = text?["rec"]
        {
        cell.cellTextView.textColor = UIColor.black
        cell.cellTextView.text = str
        cell.profileImageView.isHidden = false
        cell.bubbleViewRightAnchor?.isActive = false
        cell.bubbleViewLeftAnchor?.isActive = true
        cell.cellBubleView.backgroundColor = UIColor.lightGray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var size:CGSize!
        let text = loadData[indexPath.row] as? [String:String]
        if let str = text?["send"]
        {
        let height = estimateFrameForText(str).height
        size = CGSize.init(width: kwidth, height: height+20)
        }
        else if let str = text?["rec"]
        {
        let height = estimateFrameForText(str).height
        size = CGSize.init(width: kwidth, height: height+20)
        }
      return size
    }
    
    lazy var inputContainerView: ChatInputView = {
        let chatInputContainerView = ChatInputView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        chatInputContainerView.collectionVW = self
        return chatInputContainerView
    }()
    
    override var inputAccessoryView: UIView?
    {
       get
      {
         return  inputContainerView
      }
    }
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    func handletap()
    {
        if inputContainerView.inputTextField.text != ""
        {
        let dic = ["send":inputContainerView.inputTextField.text!]
        loadData.add(dic)
        let dic2 = ["rec":inputContainerView.inputTextField.text!]
        loadData.add(dic2)

    
       let indexPath = IndexPath(item: loadData.count - 1, section: 0)
            collectionView?.reloadData()
            collectionView?.scrollToItem(at: indexPath, at: .top, animated: true)
        //self.collectionView?.insertItems(at: [indexPath])
        inputContainerView.inputTextField.text = nil
        }
        
       

    }
    
    fileprivate func estimateFrameForText(_ text: String) -> CGRect
    {
        let size = CGSize(width: 200-16, height: CGFloat(MAXFLOAT))
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return  NSAttributedString(string: text, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)]).boundingRect(with: size, options: options, context: nil)
       // return NSAttributedString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    func setupKeyboardObservers()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    func handleKeyboardDidShow()
    {
        if megArray.count > 0
        {
            let indexPath = IndexPath(item: loadData.count - 1, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .top, animated: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
}


//        if height > 150
//        {
//            return CGSize.init(width: kwidth, height: height)
//        }
//        else
//        {
//            return CGSize.init(width: kwidth, height: height+20)
//        }


