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
    
    let items = ["This order of insects earns its name from a notoriously short-lived adult lifespan, which can last less than 24 hours. However, young mayfly nymphs may feed and grow in streams, rivers, lakes, and ponds for up to two years. As important links in the freshwater food web, young mayflies are often voracious herbivores, detritivores, or even carnivores, in addition to being preferred food sources for many freshwater carnivores."]

    override func viewDidLoad() {
      super.viewDidLoad()
      if let order_content = order {
        pollutionType.text = order_content.pollution
        pollutionIntro.text = order_content.orderIntro
        history.text = order_content.lifeHistory
        print(order_content.illustrationImage)
        illustrationImage.image = UIImage(named:order_content.illustrationImage)
      }
//      self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
