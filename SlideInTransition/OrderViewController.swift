//
//  FamilyViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/12.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
  
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
  
    // ======================== Top menu variables ========================
    let topMenuButtonCollapse = UIButton(frame: CGRect(x: 0, y: 0, width: 130, height: 30))
    let topMenuButtonExpand = UIButton(frame: CGRect(x: 0, y: 0, width: 130, height: 30))
    var topMenuCollapse = true

  
    let topMenuItems = ["Beetles", "Beetles (larval)", "True Flies", "Mayflies", "True Bugs",
                        "Aquatic Caterpillars", "Alderflies, Dobsonflies", "Dragonflies, Damselflies",
                        "Stoneflies", "Caddisflies"]
    var topView: UIView?
  
    var orders = Order.fetchOrders()
     // ======================== Top menu variables ========================
    
    /// Instantiate ViewControllers Here With Lazy Keyword
    
    // MARK: Order ViewController
    lazy var vc1: OrderFirstViewController = {
        
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "OrderFirstViewController") as! OrderFirstViewController
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: MARKET ViewController
    
    lazy var vc2: OrderSecondViewController = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "OrderSecondViewController") as! OrderSecondViewController
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: GRAPH ViewController
    
    lazy var vc3: OrderThirdViewController = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "OrderThirdViewController") as! OrderThirdViewController
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
      
        // Top Menu Setup
        self.topMenuButtonExpand.setTitle("Ephemeroptera",for: .normal)
        self.topMenuButtonExpand.setImage(UIImage(named:"expand-arrow"), for: .normal)
        self.topMenuButtonExpand.imageView?.contentMode = .scaleAspectFit
        self.topMenuButtonExpand.imageEdgeInsets = UIEdgeInsets(top: 0, left: 160, bottom: 0, right: 0)
        self.topMenuButtonExpand.setTitleColor(UIColor.black,for: .normal)
        self.topMenuButtonExpand.addTarget(self, action: #selector(showTopMenuPop(_:)),for: .touchUpInside)
        self.navigationItem.titleView = topMenuButtonExpand
      
        
        ssss()
        currentPage = 0
        createPageViewController()
        
        arrVC.append(vc1)
        arrVC.append(vc2)
        arrVC.append(vc3)

        // Do any additional setup after loading the view.
//        familyIntro.lineBreakMode = .byWordWrapping
//        familyIntro.numberOfLines = 0
//        familyIntro.text = items[0]
        
    }
  
    @IBAction func showTopMenuPop(_ sender: UIBarButtonItem) {
      if self.topMenuCollapse{
        self.topMenuCollapse = false
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TopMenuPop") as! TopMenuPopViewController
        self.addChild(popupVC)
        popupVC.view.frame = self.view.frame
        self.view.addSubview(popupVC.view)
        popupVC.didMove(toParent: self)
        self.topMenuButtonExpand.setImage(UIImage(named:"collapse-arrow"), for: .normal)
        
      } else {
        self.topMenuCollapse = true
        self.topMenuButtonExpand.setImage(UIImage(named:"expand-arrow"), for: .normal)
        self.view.subviews.last?.removeFromSuperview()
      }
    
    }
  
    var segmentedControl: CustomSegmentedContrl!
        
        func ssss() {
            segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: 200, width: self.view.frame.width, height: 45))
            
            segmentedControl.backgroundColor = .white
            segmentedControl.commaSeperatedButtonTitles = "Families, Overview, Characters"
            segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
            
            self.view.addSubview(segmentedControl)
            
        }
    
    private func createPageViewController() {
        
      pageController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = self
        pageController.dataSource = self
        
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = self
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.pageController.view.frame = CGRect(x: 0, y: self.segmentedControl.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
        }
        
       // arrVC = [vc1, vc2, vc3]
        
      pageController.setViewControllers([vc1], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        
      self.addChild(pageController)
        self.view.addSubview(pageController.view)
      pageController.didMove(toParent: self)
    }
    
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.index(of: viewCOntroller)!
        }
        
        return -1
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index - 1
        }
        
        if(index < 0) {
            return nil
        }
        else {
            return arrVC[index]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index + 1
        }
        
        if(index >= arrVC.count) {
            return nil
        }
        else {
            return arrVC[index]
        }
        
    }
    
    func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed) {
            currentPage = arrVC.index(of: (pageViewController1.viewControllers?.last)!)
           // self.segmentedControl.selectedSegmentIndex = currentPage
            
            self.segmentedControl.updateSegmentedControlSegs(index: currentPage)
            
        }

    }
  
    @objc func onChangeOfSegment(_ sender: CustomSegmentedContrl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
          pageController.setViewControllers([arrVC[0]], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
            currentPage = 0
            
        case 1:
            if currentPage > 1{
              pageController.setViewControllers([arrVC[1]], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 1
            }else{
              pageController.setViewControllers([arrVC[1]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
                currentPage = 1
                
            }
        case 2:
            if currentPage < 2 {
              pageController.setViewControllers([arrVC[2]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
                currentPage = 2
                
                
            }else{
              pageController.setViewControllers([arrVC[2]], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 2
                
            }
        default:
            break
        }
        
        
    }
    
   

}

extension UIViewController {
    open override func awakeFromNib() {
      navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
