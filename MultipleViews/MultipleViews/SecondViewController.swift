//
//  SecondViewController.swift
//  MultipleViews
//
//  Created by Avinash Jain on 9/29/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name: String = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(name)"
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
