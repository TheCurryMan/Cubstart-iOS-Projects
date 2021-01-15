//
//  ViewController.swift
//  Cubstart-Hello-World
//
//  Created by Avinash Jain on 9/22/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    
    @IBOutlet weak var clickMeButton: UIButton!
    
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func incrementCounter(_ sender: Any) {
        counter = counter + 1
        helloWorldLabel.text = "\(counter)"
    }
    
    @IBAction func decrementCounter(_ sender: Any) {
        counter = counter - 1
        helloWorldLabel.text = "\(counter)"

    }
}

