//
//  FamilySecondViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/5/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FamilySecondViewController: UIViewController {

  var family: Family!
  
  @IBOutlet weak var pollution: UILabel!
  @IBOutlet weak var familyDescription: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        if let family_content = family {
        pollution.text = family_content.pollution
        familyDescription.text = family_content.description
        
    }
        // Do any additional setup after loading the view.
    }
    


}
