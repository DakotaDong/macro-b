//
//  QuestionResultViewController.swift
//  macroApp2
//
//  Created by Chelsea Cui on 4/13/20.
//  Copyright © 2020 Chelsea Cui. All rights reserved.
//

import UIKit

class QuestionResultViewController: UIViewController {
  
    var question: Question?
  
    @IBOutlet weak var orderNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let q = question {
          orderNameLabel?.text = q.question
        }

        // Do any additional setup after loading the view.
    }
}
