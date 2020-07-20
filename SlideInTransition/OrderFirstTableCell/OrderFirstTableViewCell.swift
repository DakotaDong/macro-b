//
//  OrderFirstTableViewCell.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/13.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderFirstTableViewCell: UITableViewCell {
  
  var fakeFamilyPictures = [
    "attenella",
    "baetis-ventral",
    "baetis"
  ]

  @IBOutlet weak var scientificName: UILabel!
  @IBOutlet weak var commonName: UILabel!
  
  @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension OrderFirstTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return fakeFamilyPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! familyCollectionViewCell
        let fakeImage = fakeFamilyPictures[indexPath.row]
      cell.image.image = loadImage(fakeImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 136, height: 256)
    }
    
    
}

class familyCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var image: UIImageView!
  
}

func loadImage(_ image_name:String?) -> UIImage{
  let fm = FileManager.default
  let path = Bundle.main.resourcePath!
  
  if let name = image_name {
    do {
         let items = try! fm.contentsOfDirectory(atPath: path)
         for item in items {
           if item.hasPrefix(name) && item.hasSuffix(".png") {
             return UIImage(named: item) ?? UIImage(named: "aquatic")!
           }
        }
      } catch{
        return UIImage(named: "aquatic")!
    }
  }
  return UIImage(named: "aquatic")!
}
