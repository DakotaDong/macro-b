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
        Family(familyLabel: "Heterocloeon", familyImage: UIImage(named: "alderflier")!),
        Family(familyLabel: "Baetis", familyImage: UIImage(named: "alderflier")!)
    ]
    override func viewDidLoad() {
        print("sssssss")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
}

extension FamilySpecimanViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(families.count)
        return families.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FamilySpecimenCollectionViewCell", for: indexPath) as!
            FamilySpecimanCollectionViewCell
        
        cell.familyImage.image = families[indexPath.row].familyImage
        cell.familyLabel.text = families[indexPath.row].familyLabel
        
        return cell
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         print("!!!!!!!!!!!!!!!!!!")
         return CGSize(width: 256, height: 379)
     }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
//        return CGSize(width: size, height: size)
//    }
}
