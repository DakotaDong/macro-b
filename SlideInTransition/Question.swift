//
//  Question.swift
//  macroApp2
//
//  Created by Chelsea Cui on 4/4/20.
//  Copyright © 2020 Chelsea Cui. All rights reserved.
//

import Foundation


struct Choice {
  var text: String?
  var point_to: Int?
}

struct Question {
  var is_order: Bool?
  var image_names: [String]?
  var question: String?
  var num_of_choice: Int?
  var choices: [Choice]?
  var description: String?
}
