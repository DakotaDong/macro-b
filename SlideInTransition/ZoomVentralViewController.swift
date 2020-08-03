//
//  ZoomVentralViewController.swift
//  SlideInTransition
//
//  Created by Ziqi Dong on 8/3/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class ZoomVentralViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var ventralImage: UIImageView!
    @IBOutlet weak var ventralScroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ventralScroll.maximumZoomScale = 4
        ventralScroll.minimumZoomScale = 1
        
        ventralScroll.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ventralImage
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if ventralScroll.zoomScale > 1 {
            if let image = ventralImage.image {
                let ratioW = ventralImage.frame.width / image.size.width
                let ratioH = ventralImage.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                
                let conditionLeft = newWidth*ventralScroll.zoomScale > ventralImage.frame.width
                
                let left = 0.5 * (conditionLeft ? newWidth - ventralImage.frame.width : (ventralScroll.frame.width - ventralScroll.contentSize.width))
                
                let conditionTop = newHeight*ventralScroll.zoomScale > ventralImage.frame.height
                
                let top = 0.5 * (conditionTop ? newHeight - ventralImage.frame.height : (ventralScroll.frame.height - ventralScroll.contentSize.height))
                
                ventralScroll.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            ventralScroll.contentInset = .zero
        }
    }
    
}


