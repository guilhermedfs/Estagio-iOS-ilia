//
//  movieDetailsViewController.swift
//  Desafio 3(CII-3)
//
//  Created by Guilherme Silva on 25/11/21.
//

import UIKit

class movieDetailsViewController: UIViewController {
    
    var movieTitle: String?
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.unwind(for: <#T##UIStoryboardSegue#>, towards: <#T##UIViewController#>)
        
        // Do any additional setup after loading the view.
        movieTitleLabel.text = movieTitle
    }
}
