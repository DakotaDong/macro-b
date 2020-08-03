//
//  PopoverContentController.swift
//  macroApp2
//
//  Created by Chelsea Cui on 4/20/20.
//  Copyright © 2020 Chelsea Cui. All rights reserved.
//
import Foundation
import UIKit

class PopoverContentController: UIViewController {
  
  var definition:String?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.preferredContentSize = CGSize(width: 300, height: 250)
    
    let attributedString = NSMutableAttributedString(string: definition!)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 2.5 // Whatever line spacing you want in points
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
    
    let label:UILabel = UILabel()
    label.numberOfLines = 0
    //label.center = CGPoint(x: 160, y: 50)
    label.font = UIFont(name: "Nunito Sans-Bold", size: 20.0)
    label.textAlignment = .left
    label.attributedText = attributedString
    //label.text = definition
    label.textColor = UIColor.white
    label.frame = CGRect(x: 20, y: 20, width: 275, height:500)
    label.sizeToFit()
    self.view.addSubview(label)
  }
   
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
    

}

