//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Avinash Jain on 10/26/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsSourceLabel: UILabel!
}

struct NewsArticle: Decodable {
       let title: String?
       let description: String?
       let url: String?
       let urlToImage: String?
       let publishedAt: String?
       let source: NewsArticleSource?
}

struct NewsArticleSource: Decodable {
    let name: String
}

struct NewsResponse: Decodable {
    var articles: [NewsArticle]?
}

class NewsFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var selectedTopic: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var articleTopic = ""
    var articles: [NewsArticle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        
        self.selectedTopic.text = "Topic: \(articleTopic)"
        
        let apiKey = "f8d50b54f6e345f2972e5d4062edf569"
        let apiURL = "http://newsapi.org/v2/everything?q=\(self.articleTopic)&from=2020-09-26&sortBy=publishedAt&apiKey=\(apiKey)"
        let urlObject = URL(string: apiURL)
        
    
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data!)
            
                for newsArticle in newsResponse.articles! {
                    if (newsArticle.title != nil) {
                        self.articles.append(newsArticle)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsFeedTableViewCell
        let article = articles[indexPath.row]
        cell.newsTitleLabel.text = article.title!
        cell.newsDescriptionLabel.text = article.description!
        if let imageURL = article.urlToImage {
            do {
                cell.newsImageView.image = UIImage(data: try Data(contentsOf: URL(string: imageURL)!))
            } catch {
                print("couldn't load image for this news article")
            }
        }
        cell.newsSourceLabel.text = article.source!.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: articles[indexPath.row].url!) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }
}

