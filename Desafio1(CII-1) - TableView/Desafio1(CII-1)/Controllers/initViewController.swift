//
//  ViewController.swift
//  Desafio1(CII-1)
//
//  Created by Guilherme Silva on 23/11/21.
//

import UIKit

class initViewController: UIViewController{
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Applying rounded corners in the button
        nextButton.layer.cornerRadius = 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToColors" {
            let destinationVC = segue.destination as! colorsViewController

            destinationVC.delegate = self
        }
    }
    
}

extension initViewController:ChangeColor {
    func colorChanged(color: UIColor){
        navigationController?.popViewController(animated: true)
        self.view.backgroundColor = color
    }
}

