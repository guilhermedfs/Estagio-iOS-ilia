//
//  ztoAViewController.swift
//  Desafio2(CII-2)
//
//  Created by Guilherme Silva on 24/11/21.
//

import UIKit

class ztoAViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sort the colors in alphabetical order descending
        colors.sortColorsDesc()
        
        // Calls the custom table view cell
        table.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
    }
    
}

extension ztoAViewController: UITableViewDelegate{
    
}

extension ztoAViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        // Disable user selection
        cell.selectionStyle = .none

        let color = colors.colors[indexPath.row]
        
        // Pass the parameters to set the labels and imageview
        if let colorImage = colors.colorsDict[color]{
            if let translation = colors.translateDict[color] {
                cell.configure(with: color, color: colorImage, translation: translation)
            }
        }
        
        return cell
    }
}
