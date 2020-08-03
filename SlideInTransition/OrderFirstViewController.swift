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
    
    // doesn't work
    @IBOutlet weak var containerView: UIView!
    func didSet() {
        // Make it card-like
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor(named: "Orange")?.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.backgroundColor = UIColor(named: "Red")
    }
    
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
        
        // test
        //for table view border
//        cell.layer.borderWidth = 2.0
        cell.layer.cornerRadius = 5.0
//        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.collectionView.layer.shadowColor = UIColor.red.cgColor
        cell.collectionView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.collectionView.layer.shadowRadius = 2.0
        cell.collectionView.layer.shadowOpacity = 1
        cell.collectionView.layer.masksToBounds = false
        cell.collectionView.layer.cornerRadius = 5.0
        cell.collectionView.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 278
    }
    
}
