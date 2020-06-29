//
//  FirstViewController.swift
//  tabbedApp
//
//  Created by Plam Stefanova on 6/18/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBAction func btnPressed(_ sender: Any) {
        guard let numberString = (sender as AnyObject).titleLabel?.text,
                  let url = URL(string:"telprompt://\(numberString)") else {
                return
            }
            UIApplication.shared.open(url)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

