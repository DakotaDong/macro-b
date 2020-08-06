//
//  OrderSecondViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 7/16/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderSecondViewController: UIViewController {
  
    
  @IBOutlet weak var illustrationImage: UIImageView!
  @IBOutlet weak var familyIntro: UILabel!
    
    @IBOutlet weak var pollutionType: UILabel!
    
    @IBOutlet weak var pollutionIntro: UILabel!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var history: UILabel!
    
    var name = ""
    var order: Order!
    

    override func viewDidLoad() {
      super.viewDidLoad()
      if let order_content = order {
        pollutionType.text = order_content.pollution
        pollutionIntro.text = order_content.orderIntro
        history.text = order_content.lifeHistory
        print(order_content.illustrationImage)
        illustrationImage.image = UIImage(named:order_content.illustrationImage)
      }
    }
}
