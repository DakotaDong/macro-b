//
//  Genus.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/4/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class Genus
{
    var id:Int
    var familyId:Int
    var name = ""
    var ventralImage = ""
    var dorsalImage = ""
    
  init(id:Int, familyId: Int, name: String, ventralImage: String, dorsalImage: String)
    {
        self.id = id
        self.familyId = familyId
        self.name = name
        self.ventralImage = ventralImage
        self.dorsalImage = dorsalImage
    }
}
