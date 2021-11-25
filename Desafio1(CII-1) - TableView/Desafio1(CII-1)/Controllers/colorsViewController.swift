//
//  colorsViewController.swift
//  Desafio1(CII-1)
//
//  Created by Guilherme Silva on 23/11/21.
//

import UIKit

class colorsViewController: UIViewController{
    
    var delegate: ChangeColor?
    let colors: [String] = [
        "Blue",
        "Green",
        "Pink",
        "Red",
        "Yellow"
    ]
    
    let colorsDict: [String: UIColor] = [
        "Red": .red,
        "Green": .green,
        "Blue": .blue,
        "Pink": .systemPink,
        "Yellow": .yellow
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Applying rounded corners to all buttons
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    @IBAction func colorsButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension colorsViewController: UITableViewDelegate {
    
}

extension colorsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(with: colors[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}

extension colorsViewController: CustomTableViewCellDelegate {
    func didTapButton(with title: String) {
        if let color = colorsDict[title]{
            delegate?.colorChanged(color: color)
        }
        navigationController?.popViewController(animated: true)
    }
}
