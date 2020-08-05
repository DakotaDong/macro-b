//
//  TopMenuPopViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 6/25/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class TopMenuPopViewController: UIViewController {
  
    @IBOutlet weak var collectionView: UICollectionView!
  
    var db:DBHelper = DBHelper()
    var orders:[Order] = []
  

    override func viewDidLoad() {
        super.viewDidLoad()
        orders = db.readOrders()
        //self.collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension TopMenuPopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "TopMenuPopCollectionViewCell", for: indexPath) as!
            TopMenuPopCollectionViewCell
        let order = orders[indexPath.item]
        
        cell.name.text = order.commonName
        cell.image.image = UIImage(named: order.featuredImage)
        //cell.backgroundColor = UIColor.red
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

          let noOfCellsInRow = 4

          let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

          let totalSpace = flowLayout.sectionInset.left
              + flowLayout.sectionInset.right
              + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

          let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

          return CGSize(width: size, height: size)
      }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =
            storyboard?
                .instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController
        vc?.order = orders[indexPath.item]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

