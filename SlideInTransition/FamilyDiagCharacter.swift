//
//  FamilyDiagCharacter.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/4/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class FamilyDiagCharacter
{
    var id:Int
    var familyId:Int
    var name = ""
    var description = ""
    
  init(id:Int, familyId: Int, name: String, description:String)
    {
        self.id = id
        self.familyId = familyId
        self.name = name
        self.description = description
    }
}
