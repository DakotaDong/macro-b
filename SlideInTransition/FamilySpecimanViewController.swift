//
//  FamilySpecimanViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/25.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FamilySpecimanViewController: UIViewController {
  
    var db:DBHelper = DBHelper()
    var genera:[Genus] = []
  
    var family: Family!
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if let family_content = family {
          genera = db.readGenusByFamily(familyId: family_content.id)
        }

        // Do any additional setup after loading the view.
    }
 
}

extension FamilySpecimanViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genera.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FamilySpecimenCollectionViewCell", for: indexPath) as!
            FamilySpecimanCollectionViewCell
        let genus = genera[indexPath.row]
        cell.familyImage.image = UIImage(named: "acentrella") /// TODO: FIX THIS
        cell.familyLabel.text = genus.name
        
        return cell
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 256, height: 379)
     }

}
