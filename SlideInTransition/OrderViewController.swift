//
//  FamilyViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/12.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var familyImage: UIImageView!
    @IBOutlet weak var familyIntro: UILabel!
    
    @IBOutlet weak var pollutionType: UILabel!
    
    @IBOutlet weak var pollutionIntro: UILabel!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var history: UILabel!
    
    
    var name = ""
    
    let items = ["This order of insects earns its name from a notoriously short-lived adult lifespan, which can last less than 24 hours. However, young mayfly nymphs may feed and grow in streams, rivers, lakes, and ponds for up to two years. As important links in the freshwater food web, young mayflies are often voracious herbivores, detritivores, or even carnivores, in addition to being preferred food sources for many freshwater carnivores."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        familyIntro.lineBreakMode = .byWordWrapping
//        familyIntro.numberOfLines = 0
//        familyIntro.text = items[0]
        
    }
    
   

}
