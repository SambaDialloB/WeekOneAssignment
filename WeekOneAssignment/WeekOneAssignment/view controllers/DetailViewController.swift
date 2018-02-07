//
//  DetailViewController.swift
//  WeekOneAssignment
//
//  Created by Samba on 2/7/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    
    
    var movie: [String: Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            titleLabel.text = movie["title"] as? String
            releaseLabel.text = movie["release_date"] as? String
            overview.text = movie["overview"] as? String
            let backdropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let beg = "https://image.tmdb.org/t/p/w500"
            let backURL = URL(string: beg + backdropPathString)!
            backdrop.af_setImage(withURL: backURL)
            let posterURL = URL(string: beg + posterPathString)!
            poster.af_setImage(withURL: posterURL)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
