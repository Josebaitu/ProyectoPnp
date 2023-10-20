//
//  ApiViewController.swift
//  Proyecto_Joseba_PNP
//
//  Created by Joseba Iturrioz Aguirre on 19/10/23.
//

import UIKit

struct NewsModel: Codable {
    var articles: [New]
}

struct New: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

class ApiViewController: UIViewController {
    
    var newsArticle: [New] = []
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(UINib(nibName: "NewsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        searchNews()
    }
    
    func searchNews() {
        let urlString = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0ec8902e2a5c491a8fb1cf1d96449ee2")!
        var request = URLRequest(url: urlString)
        request.addValue("0ec8902e2a5c491a8fb1cf1d96449ee2", forHTTPHeaderField: "TRN-Api-Key")
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                let decodedData = self.decodeData(data)
                self.newsArticle = decodedData.articles
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
            }
        }
        dataTask.resume()
    }
    
    func decodeData(_ data: Data) -> NewsModel {
        do {
            let decodedData = try JSONDecoder().decode(NewsModel.self, from: data)
            return decodedData
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
}

extension ApiViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCellTableViewCell
        let information = newsArticle[indexPath.row]
        cell.newTitleLabel.text = information.title
        cell.newDescriptionLabel.text = information.description
        
        if let url = URL(string: information.urlToImage ?? "") {
            if let imageData = try? Data(contentsOf: url) {
                cell.newImageView.image = UIImage(data: imageData)
            }
        }
        
        return cell
    }
    
    
}
