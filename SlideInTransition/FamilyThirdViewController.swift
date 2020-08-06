//
//  FamilyThirdViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/5/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FamilyThirdViewController: UIViewController {
    
    var family: Family!
    var db:DBHelper = DBHelper()
    var familyDiagCharacters:[FamilyDiagCharacter] = []
    var familyName = ""
    var orderName = ""
    
    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var characterTableHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.characterTableView.allowsSelection = false
      if let family_content = family {
        familyDiagCharacters = db.readFamilyDiagCharacterByFamily(familyId: family_content.id)
        familyName = family_content.scientificName
      }

    }
    override func viewWillAppear(_ animated: Bool) {
      self.characterTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
      self.characterTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      self.characterTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if keyPath == "contentSize"{
        if let newvalue = change?[.newKey]{
          let newsize = newvalue as! CGSize
          self.characterTableHeight.constant = newsize.height
        }
      }
    }
    
  }



  extension FamilyThirdViewController:UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let size = familyDiagCharacters.count
      self.characterTableHeight.constant = CGFloat(size) * UITableViewCell().frame.size.height
      return size
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "familyCharacterTableViewCell", for: indexPath) as! familyCharacterTableViewCell

      let character = familyDiagCharacters[indexPath.row]
      cell.characterName?.text = character.name
      cell.characterDescription?.text = character.description
      cell.UpdateViews(orderName:orderName,familyName:familyName,dcName:character.name)
      
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 200
    }
   
   
  }


  class familyCharacterTableViewCell: UITableViewCell {
    
    var imageArray = [UIImage]()
  //  var orderName:String!
  //  var dcName:String!
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func prepareForReuse() {
      super.prepareForReuse()
      collectionView.dataSource = nil
      collectionView.delegate = nil
      imageArray = [UIImage]()
      collectionView.reloadData()
      collectionView.delegate = self
      collectionView.dataSource = self
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       collectionView.delegate = self
       collectionView.dataSource = self
      
    }
    
    func UpdateViews(orderName:String,familyName:String,dcName:String){
      loadFamilyDCImages(orderName:orderName,familyName: familyName,name:dcName)
    }
    
    func loadFamilyDCImages(orderName:String, familyName:String, name:String) {
     let fm = FileManager.default

      let ref_name = name.components(separatedBy:" ").joined(separator: "").components(separatedBy:"-").joined(separator: "").lowercased()
     let ref_orderName = orderName.components(separatedBy:" ").joined(separator: "-").lowercased()
     let ref_familyName = familyName.components(separatedBy:" ").joined(separator: "-").lowercased()
     let path = Bundle.main.resourceURL!.appendingPathComponent("img/orders/\(ref_orderName)/\(ref_familyName)/dc").path
    
     do {
        let items = try fm.contentsOfDirectory(atPath: path)
        for item in items {
          let reformatted_item_name = item.components(separatedBy:" ").joined(separator: "").components(separatedBy:"-").joined(separator: "").lowercased()
//          print("RRRR",reformatted_item_name,ref_name)
          if reformatted_item_name.hasPrefix(ref_name) && (item.hasSuffix(".jpg")||item.hasSuffix(".png")) {
            let imageURL = Bundle.main.resourceURL!.appendingPathComponent("img/orders/\(ref_orderName)/\(ref_familyName)/dc/\(item)")
            imageArray.append(UIImage(contentsOfFile: imageURL.path) ?? UIImage(named: "aquatic")!)
          }
        }
    } catch let error {
      imageArray = []
    }
    
    }

  }

  extension familyCharacterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell =
          collectionView.dequeueReusableCell(withReuseIdentifier: "FamilyDCCollectionViewCell", for: indexPath) as!
          FamilyDCCollectionViewCell
      cell.image.image = imageArray[indexPath.item]
      return cell
    }
    
    
  }
  class FamilyDCCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
  }

