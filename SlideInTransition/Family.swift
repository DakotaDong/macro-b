//
//  Family.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/6/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class Family
{
    var id:Int
    var orderId:Int
    var commonName = ""
    var scientificName = ""
    var pollution = ""
    var description = ""
    
  init(id:Int, orderId:Int, commonName: String, scientificName: String, pollution: String, description: String)
    {
        self.id = id
        self.orderId = orderId
        self.commonName = commonName
        self.scientificName = scientificName
        self.pollution = pollution
        self.description = description
    }

}
