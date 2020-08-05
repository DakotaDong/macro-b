//
//  OrderThirdViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 7/16/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

struct Character {
  var name: String
  var description: String
}
 
class OrderThirdViewController: UIViewController {
  
  var order: Order!
  var db:DBHelper = DBHelper()
  var orderDiagCharacters:[OrderDiagCharacter] = []
  var orderName = ""
  
  @IBOutlet weak var characterTableView: UITableView!
  @IBOutlet weak var characterTableHeight: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.characterTableView.allowsSelection = false
    if let order_content = order {
      orderDiagCharacters = db.readOrderDiagCharacterByOrder(orderId: order_content.id)
      orderName = order_content.scientificName
    }
//    self.view.backgroundColor = .red

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



extension OrderThirdViewController:UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let size = orderDiagCharacters.count
    self.characterTableHeight.constant = CGFloat(size) * UITableViewCell().frame.size.height
    return size
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterTableViewCell", for: indexPath) as! characterTableViewCell

    let character = orderDiagCharacters[indexPath.row]
    cell.characterName?.text = character.name
    cell.characterDescription?.text = character.description
    
    cell.UpdateViews(orderName:orderName,dcName:character.name)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
 
 
}


class characterTableViewCell: UITableViewCell {
  
  var imageArray = [UIImage]()
  var orderName:String!
  var dcName:String!
  
  @IBOutlet weak var characterName: UILabel!
  @IBOutlet weak var characterDescription: UILabel!
  
  override func awakeFromNib() {
     super.awakeFromNib()
  }
  
  func UpdateViews(orderName:String,dcName:String){
    loadOrderDCImages(orderName: orderName,name:dcName)
  }
  
  func loadOrderDCImages(orderName:String, name:String) {
   let fm = FileManager.default

    let ref_name = name.components(separatedBy:" ").joined(separator: "").components(separatedBy:"-").joined(separator: "").lowercased()
   let ref_orderName = orderName.components(separatedBy:" ").joined(separator: "-").lowercased()
   let path = Bundle.main.resourceURL!.appendingPathComponent("img/orders/\(ref_orderName)/dc").path
  
   do {
      let items = try fm.contentsOfDirectory(atPath: path)
      for item in items {
        let reformatted_item_name = item.lowercased()
        if reformatted_item_name.hasPrefix(ref_name) && (item.hasSuffix(".jpg")||item.hasSuffix(".png")) {
          let imageURL = Bundle.main.resourceURL!.appendingPathComponent("img/orders/\(ref_orderName)/dc/\(item)")
          imageArray.append(UIImage(contentsOfFile: imageURL.path) ?? UIImage(named: "aquatic")!)
        }
      }
  } catch let error {
    imageArray = []
  }
  
  }

}

extension characterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: "OrderDCCollectionViewCell", for: indexPath) as!
        OrderDCCollectionViewCell
    cell.image.image = imageArray[indexPath.item]
    return cell
  }
  
  
}
class OrderDCCollectionViewCell:UICollectionViewCell {
  @IBOutlet weak var image: UIImageView!
  
}

