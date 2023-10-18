//
//  ViewController.swift
//  Articles
//
//  Created by Diego Rodrigues on 13/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var news: News? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName:"NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        
        ArticlesViewModel.getArticles{ news in
            self.news = news
            
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let article = news?.articles[indexPath.row]
        cell.titleLabel.text = article?.title
        cell.descriptionLabel.text = article?.description
        cell.selectionStyle = .none
        return cell
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = news?.articles[indexPath.row] {
            let detailViewController = NewsDetailViewController()
            detailViewController.selectedArticle = article
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
