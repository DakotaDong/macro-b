//
//  ZoomViewController.swift
//  SlideInTransition
//
//  Created by Ziqi Dong on 8/3/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var ventralBtn: UIButton!
    @IBOutlet weak var zoomScroll: UIScrollView!
    @IBOutlet weak var zoomImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomScroll.maximumZoomScale = 4
        zoomScroll.minimumZoomScale = 1
        
        zoomScroll.delegate = self
    }
    @IBAction func clickedVentralBtnAction(sender: UIButton) {
        zoomImage.image = UIImage(named: "aquatic")
    }
    @IBAction func clickedDorsalBtnAction(sender: UIButton) {
        zoomImage.image = UIImage(named: "aquatic")
    }

}

extension ZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomImage
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if zoomScroll.zoomScale > 1 {
            if let image = zoomImage.image {
                let ratioW = zoomImage.frame.width / image.size.width
                let ratioH = zoomImage.frame.height / image.size.height
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                
                let conditionLeft = newWidth*zoomScroll.zoomScale > zoomImage.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - zoomImage.frame.width : (zoomScroll.frame.width - zoomScroll.contentSize.width))
                let conditionTop = newHeight*zoomScroll.zoomScale > zoomImage.frame.height
                let top = 0.5 * (conditionTop ? newHeight - zoomImage.frame.height : (zoomScroll.frame.height - zoomScroll.contentSize.height))
                
                zoomScroll.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            zoomScroll.contentInset = .zero
        }
    }
    
}
