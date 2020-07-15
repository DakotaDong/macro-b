//
//  OrderFirstViewController.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/7/13.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OrderFirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}

extension OrderFirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFirstTableViewCell", for: indexPath) as? OrderFirstTableViewCell else {fatalError("Unable to create OrderFirstTableViewCell")}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 278
    }
    
}
