//
//  CustomTableViewCell.swift
//  Desafio2(CII-2)
//
//  Created by Guilherme Silva on 24/11/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    var color: UIColor?
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    @IBOutlet var colorsLabel: UILabel!
    @IBOutlet var colorImageView: UIImageView!
    @IBOutlet var translationLabel: UILabel!
    
    func configure(with text: String, color: UIColor, translation: String){
        colorsLabel.text = text
        colorImageView.backgroundColor = color
        translationLabel.text = "Cor \(translation)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
