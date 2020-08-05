//
//  OrdersCollectionViewCell.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/6/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredIamgeView: UIImageView!
    @IBOutlet weak var ordersTitleLabel: UILabel!
    @IBOutlet weak var ordersSubTitleLabel: UILabel!
    
    var order: Order! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let order = order {
            print("CCCC",order.commonName,order.scientificName,order.featuredImage)
            featuredIamgeView.image = UIImage(named: order.featuredImage)
            ordersTitleLabel.text = order.commonName
            ordersSubTitleLabel.text = order.scientificName
            
            
        } else {
            featuredIamgeView.image = nil
            ordersTitleLabel.text = nil
            ordersSubTitleLabel.text = nil
           
        }
        featuredIamgeView.layer.shadowColor = UIColor.black.cgColor
        featuredIamgeView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        featuredIamgeView.layer.masksToBounds = false
        featuredIamgeView.layer.shadowRadius = 2.0
        featuredIamgeView.layer.shadowOpacity = 0.5
        featuredIamgeView.layer.cornerRadius = 10.0

        ordersTitleLabel.lineBreakMode = .byWordWrapping
        ordersTitleLabel.numberOfLines = 0
        ordersTitleLabel.text = order.commonName
    }
}
