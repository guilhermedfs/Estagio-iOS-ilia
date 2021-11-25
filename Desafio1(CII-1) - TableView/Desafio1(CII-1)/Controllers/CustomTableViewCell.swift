//
//  CustomTableViewCell.swift
//  Desafio1(CII-1)
//
//  Created by Guilherme Silva on 24/11/21.
//

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    static let identifier = "CustomTableViewCell"
    private var title: String = ""
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    
    @IBAction func didTapButton() {
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String){
        self.title = title
        button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.setTitleColor(.link, for: .normal)
    }
}

