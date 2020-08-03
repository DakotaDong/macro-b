//
//  KeyStartViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/3/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class KeyStartViewController: UIViewController {

    let start_question =  Question(is_order: false,
                                    image_names:["jointed-legs"],
                                    question: "Are there jointed legs?",
                                    num_of_choice: 4,
                                    choices: [Choice(text: "6 Legs", point_to: 1), Choice(text: "8 Legs", point_to: 30), Choice(text: "10 Legs", point_to: 30), Choice(text: "No", point_to: 3)],
                                    description: "Jointed Legs\nTrue legs, legs capable of bending.")
      
      @IBOutlet weak var start: UILabel!
      
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
      }
      
      override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.isHidden = true;
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startQuestion" {
          let startQuestion: QuestionViewController = segue.destination as! QuestionViewController
          startQuestion.question = start_question
        }
      }
      

}

