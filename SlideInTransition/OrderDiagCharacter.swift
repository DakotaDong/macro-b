//
//  OrderDiagCharacter.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/3/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class OrderDiagCharacter
{
    var id:Int
    var orderId:Int
    var name = ""
    var description = ""
    
  init(id:Int, orderId: Int, name: String, description:String)
    {
        self.id = id
        self.orderId = orderId
        self.name = name
        self.description = description
    }
}
