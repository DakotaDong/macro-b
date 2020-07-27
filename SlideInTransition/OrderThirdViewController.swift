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
  @IBOutlet weak var characterTableView: UITableView!
  @IBOutlet weak var characterTableHeight: NSLayoutConstraint!
  
  let characters = [
    Character(name:"Single Tarsal Claw", description: "Always with only one tarsal claw per leg."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen.")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.characterTableView.allowsSelection = false
    self.view.backgroundColor = .red

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
    let size = characters.count
    self.characterTableHeight.constant = CGFloat(size) * UITableViewCell().frame.size.height
    return size
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterTableViewCell", for: indexPath) as! characterTableViewCell

    let character = characters[indexPath.row]
    cell.characterName?.text = character.name
    cell.characterDescription?.text = character.description

    return cell
  }
//
//  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//    return UITableView.automaticDimension
//  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
 
 
}


class characterTableViewCell: UITableViewCell {
  
  @IBOutlet weak var characterName: UILabel!
  @IBOutlet weak var characterDescription: UILabel!
}

