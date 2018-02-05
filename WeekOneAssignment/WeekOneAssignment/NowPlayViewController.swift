//
//  NowPlayViewController.swift
//  WeekOneAssignment
//
//  Created by Samba on 2/4/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var movies: [[String: Any]] = []
    var refresh:UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(NowPlayViewController.didPTR(_:)), for: .valueChanged)
        tableView.insertSubview(refresh, at: 0)
        
        tableView.dataSource = self
        loading.startAnimating()
        fetchMovies()
        loading.stopAnimating()
        
    }
    @objc func didPTR(_ refresh:UIRefreshControl){
        loading.startAnimating()
        fetchMovies()
        loading.stopAnimating()
    }
    func fetchMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the network request returns
            if let error = error{
                print(error.localizedDescription)
            }else if let data = data{
                let dataDic = try!JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let movies = dataDic["results"] as! [[String:Any]]
                self.movies = movies
                self.tableView.reloadData()
                self.refresh.endRefreshing()
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let over = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.overLabel.text = over
        let posterPathString = movie["poster_path"] as! String
        let beg = "https://image.tmdb.org/t/p/w500"
        
        let posterURL = URL(string: beg + posterPathString)!
        cell.imageV.af_setImage(withURL: posterURL)
        return cell;
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
