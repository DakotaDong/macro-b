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
 
class OrderThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  let characters = [
    Character(name:"Single Tarsal Claw", description: "Always with only one tarsal claw per leg."),
    Character(name:"Abnormal Gills", description: "Gills on abdomen.")
  ]

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterTableViewCell", for: indexPath) as! characterTableViewCell

    let character = characters[indexPath.row]
    cell.characterName?.text = character.name
    cell.characterDescription?.text = character.description

    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 278
  }
 
   
  @IBOutlet weak var characterTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}


class characterTableViewCell: UITableViewCell {
  
  @IBOutlet weak var characterName: UILabel!
  @IBOutlet weak var characterDescription: UILabel!
}
