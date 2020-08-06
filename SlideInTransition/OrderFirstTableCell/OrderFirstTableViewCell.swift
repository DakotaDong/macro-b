//
//  OrderFirstTableViewCell.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/13.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderFirstTableViewCell: UITableViewCell {
  
  var db:DBHelper = DBHelper()
  var familyId:Int!
  var genera:[Genus] = []
  

  @IBOutlet weak var scientificName: UILabel!
  @IBOutlet weak var commonName: UILabel!
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func prepareForReuse() {

        collectionView.dataSource = nil
        collectionView.delegate = nil
        collectionView.reloadData()

        collectionView.dataSource = self
        collectionView.delegate = self
  }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)

        
    }
  
    func UpdateViews(familyId:Int){
      genera = db.readGenusByFamily(familyId: familyId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension OrderFirstTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return genera.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! familyCollectionViewCell
        /// TODO: change this when the pictures are loaded!
        let fakeImage = UIImage(named: "aquatic")
        cell.name.text = genera[indexPath.row].name
        cell.image.image = fakeImage
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 130)
    }
    
    
}

class familyCollectionViewCell: UICollectionViewCell {


  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var name: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    

  
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
}
