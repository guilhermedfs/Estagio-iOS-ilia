//
//  atoZViewController.swift
//  Desafio2(CII-2)
//
//  Created by Guilherme Silva on 24/11/21.
//

import UIKit

class atoZViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sort the colors in alphabetical order ascending
        colors.sortColorsAsc()
        
        // Calls the custom table view cell
        table.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        // Delegate the protocol of the table to this function
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
    }
}

extension atoZViewController: UITableViewDelegate {
}

extension atoZViewController: UITableViewDataSource {
    
    // Create the table view number of rows dinamically
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.getNumberOfColors()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the reausable cell we set at the custom file
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
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

