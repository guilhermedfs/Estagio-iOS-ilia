//
//  MovieCollectionViewCell.swift
//  Desafio 3(CII-3)
//
//  Created by Guilherme Silva on 25/11/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    func setup(with movie: String) {
        movieLabel.text = movie
    }
    
    func onBind(data: Result) {
        movieLabel.text = data.title
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(data.posterPath)")!)) {
            (data, res, error) in
            
            do{
                let datas = try data
                DispatchQueue.main.async {
                    self.movieImageView.image = UIImage(data: datas!)
                }
            } catch {
                print("error")
            }
        }.resume()
    }
}
