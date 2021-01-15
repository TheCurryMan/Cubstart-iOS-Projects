//
//  ViewController.swift
//  Emoji-Dictionary
//
//  Created by Avinash Jain on 10/6/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let emojis = ["🔥", "🎉", "🚀", "💡", "🦥", "😃"]
    let emojiNames = ["Fire", "Party", "Rocket", "Lightbulb", "Sloth", "Grin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "CustomUITableViewCell", bundle: nil), forCellReuseIdentifier: "customEmoji")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customEmoji", for: indexPath) as! CustomTableViewCell
        
        cell.emojiName.text = emojiNames[indexPath.row]
        cell.emojiRepresentation.text = emojis[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print(emoji)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var emojiName: UILabel!
    @IBOutlet weak var emojiRepresentation: UILabel!
}

class Custom2TableViewCell: UITableViewCell {
    @IBOutlet weak var asd: UILabel!
    
}

