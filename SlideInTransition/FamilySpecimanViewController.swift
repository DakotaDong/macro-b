//
//  FamilySpecimanViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/25.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FamilySpecimanViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
  
    var families = [
        Family(id:1, orderId:1, commonName: "Test Family Common 1", scientificName: "Test Family Sci 1", pollution: "ppp", description: "ddddd"),
        Family(id:2, orderId:1, commonName: "Test Family Common 2", scientificName: "Test Family Sci 2", pollution: "ppp", description: "ddddd")
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
}

extension FamilySpecimanViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return families.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FamilySpecimenCollectionViewCell", for: indexPath) as!
            FamilySpecimanCollectionViewCell
        
        cell.familyImage.image = UIImage(named: "alderflier")
        cell.familyLabel.text = families[indexPath.row].commonName
        
        return cell
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 256, height: 379)
     }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
//        return CGSize(width: size, height: size)
//    }
}
