//
//  ViewController.swift
//  NewProject
//
//  Created by Zeynep Sevgi on 13.11.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
  
    

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate=self
        tableView.dataSource=self
        veriAl()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    func veriAl() {
        let urlpath = "https://raw.githubusercontent.com/atilsamancioglu/BTK-İOSDataSet/master/dataset.json"
        let urlString = urlpath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) //This will fill the spaces with the %20

        
        let url = URL(string: urlString!)
        
        Webservice().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //kaç tane haber varsa onun sayısına göre
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowInsection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCellTableViewCell
        let newsViewModel = self.newsTableViewModel.newsIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

