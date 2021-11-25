//
//  colorsViewController.swift
//  Desafio1(CII-1)
//
//  Created by Guilherme Silva on 23/11/21.
//

import UIKit

class colorsViewController: UIViewController {
    
    var delegate: ChangeColor?

    @IBOutlet weak var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Applying rounded corners to all buttons
        for view in buttonStack.arrangedSubviews {
            if let button = view as? UIButton {
                button.layer.cornerRadius = 3
            }
        }
    }
    
    @IBAction func colorsButtonPressed(_ sender: UIButton) {
        delegate?.colorChanged(color: sender.backgroundColor ?? .white)
        navigationController?.popViewController(animated: true)
    }
}
