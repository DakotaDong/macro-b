//
//  FamilyViewController.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 8/5/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class FamilyViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
    
      
      private var pageController: UIPageViewController!
      private var arrVC:[UIViewController] = []
      private var currentPage: Int!
    
      @IBOutlet weak var scientificName: UILabel!
      @IBOutlet weak var commonName: UILabel!
    
      var db:DBHelper = DBHelper()
    
      var family: Family!
      var order: Order!
      var familyNames = [String]()
      var families = [Family]()
  
      var menuView = BTNavigationDropdownMenu(title: BTTitle.index(1), items: [])
    
      
      // MARK: Family ViewController
      lazy var vc1: FamilySpecimanViewController = {
          
          
          var viewController = storyboard?.instantiateViewController(withIdentifier: "FamilySpecimanViewController") as! FamilySpecimanViewController
          //self.addViewControllerAsChildViewController(childViewController: viewController)
          viewController.family = family
          return viewController
      }()
      
      // MARK: MARKET ViewController
      
      lazy var vc2: FamilySecondViewController = {
          
          var viewController = storyboard?.instantiateViewController(withIdentifier: "FamilySecondViewController") as! FamilySecondViewController
          viewController.family = family
          //self.addViewControllerAsChildViewController(childViewController: viewController)
          
          return viewController
      }()
      
      // MARK: GRAPH ViewController
      
      lazy var vc3: FamilyThirdViewController = {
          
          var viewController = storyboard?.instantiateViewController(withIdentifier: "FamilyThirdViewController") as! FamilyThirdViewController
          //self.addViewControllerAsChildViewController(childViewController: viewController)
          viewController.family = family
          viewController.orderName = order!.scientificName
          return viewController
      }()
    
      override func viewDidLoad() {
          super.viewDidLoad()
        
          if let family_content = family {
            scientificName.text = family_content.scientificName
            commonName.text = family_content.commonName
            families = db.readFamilyByOrder(orderId: order.id)
            familyNames = families.map { $0.scientificName }
            
            menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.title(family_content.scientificName), items: familyNames)
            menuView.arrowTintColor = UIColor.black
            menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
              print("Did select item at index: \(self!.families[indexPath])")
              let vc =
                self!.storyboard?
                      .instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
              vc?.family = self!.families[indexPath]
              vc?.order = self!.order
              self?.navigationController?.pushViewController(vc!, animated: true)
            }
            self.navigationItem.titleView = menuView

          }
          
          ssss()
          currentPage = 0
          createPageViewController()
          
          arrVC.append(vc1)
          arrVC.append(vc2)
          arrVC.append(vc3)
        
          
      }
  
    
    
      var segmentedControl: CustomSegmentedContrl!
          
          func ssss() {
              segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: 200, width: self.view.frame.width, height: 45))
              
              segmentedControl.backgroundColor = .white
              segmentedControl.commaSeperatedButtonTitles = "Genera, Overview, Characters"
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

