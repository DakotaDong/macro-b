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
    var familyLabel = ""
    var familyImage: UIImage
    
    init(familyLabel: String, familyImage: UIImage)
    {
        self.familyLabel = familyLabel
        self.familyImage = familyImage
    }
    
    static func fetchFamilies() -> [Family]
    {
        return [
            Family(familyLabel: "Heterocloeon", familyImage: UIImage(named: "alderflier")!),
            Family(familyLabel: "Baetis", familyImage: UIImage(named: "alderflier")!),
        ]
    }

}
