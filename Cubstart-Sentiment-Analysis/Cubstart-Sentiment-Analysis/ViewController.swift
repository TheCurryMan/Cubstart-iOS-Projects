//
//  ViewController.swift
//  Cubstart-Sentiment-Analysis
//
//  Created by Avinash Jain on 11/17/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sentimentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func analyzeText(_ sender: Any) {
        
        let timeInterval = NSDate().timeIntervalSince1970
        let id = String(timeInterval)
        let apiURL = "http://58bb46a41a1d.ngrok.io/api/analyze_sentiment/\(id)?sentence=\(textField.text!)"
        var urlString = apiURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        let urlObject = URL(string: urlString)
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            self.db.collection("sentiment-data").document(id)
                   .addSnapshotListener { documentSnapshot, error in
                     guard let document = documentSnapshot else {
                       print("Error fetching document: \(error!)")
                       return
                     }
                     guard let data = document.data() else {
                       print("Document data was empty.")
                       return
                     }
                     print("Current data: \(data)")
                    let sentiment = data["sentiment"]!
                    self.sentimentLabel.text = "Sentiment: \(sentiment)"
                    
                   }
           
        }.resume()
        
    }
    
}

