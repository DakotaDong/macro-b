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
  
    var orders = Order.fetchOrders()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        cell.name.text = order.title
        cell.image.image = order.featuredImage
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
    
}

