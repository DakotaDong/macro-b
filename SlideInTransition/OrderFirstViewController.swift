//
//  OrderFirstViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/13.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

struct FamilyA {
  var scientificName: String
  var commonName: String
}

class OrderFirstViewController: UIViewController {
  
    var families = [
      FamilyA(scientificName: "Ameletidae", commonName: "Comb-mouthed Minnow Mayflies")]
    
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}


extension OrderFirstViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFirstTableViewCell", for: indexPath) as? OrderFirstTableViewCell else {fatalError("Unable to create OrderFirstTableViewCell")}
        let family = families[indexPath.row]
      cell.scientificName.text = family.scientificName
      cell.commonName.text = family.commonName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 278
    }
    
}
