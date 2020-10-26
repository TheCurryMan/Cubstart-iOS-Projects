//
//  ViewController.swift
//  NewsFeed
//
//  Created by Avinash Jain on 10/26/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topicInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showArticles(_ sender: Any) {
        performSegue(withIdentifier: "showArticles", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showArticles") {
            let vc = segue.destination as! NewsFeedViewController
            vc.articleTopic = topicInput.text!
        }
    }
}

