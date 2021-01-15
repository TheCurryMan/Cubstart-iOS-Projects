//
//  ViewController.swift
//  MultipleViews
//
//  Created by Avinash Jain on 9/29/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterPressed(_ sender: Any) {
        performSegue(withIdentifier: "secondView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "secondView") {
            let vc = segue.destination as! SecondViewController
            vc.name = (nameTextField.text!)
        }
    }
    
}

