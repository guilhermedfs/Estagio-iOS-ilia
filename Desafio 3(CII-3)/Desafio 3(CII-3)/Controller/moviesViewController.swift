//
//  moviesViewController.swift
//  Desafio 3(CII-3)
//
//  Created by Guilherme Silva on 25/11/21.
//

import UIKit

class moviesViewController: UIViewController {
    
    var dataList = [Result]()
    var movieTitle: String?

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=0d959db44c2b30eb348d0dc5be5cc1ad&language=pt-BR&page=1")!)){
            (data, req, error) in
            
            do{
                let result = try JSONDecoder().decode(Movie.self, from: data!)
                DispatchQueue.main.async {
                    self.dataList = result.results
                    self.moviesCollectionView.reloadData()
                }
            }catch{
                print("eeeeee")
            }
        }.resume()
    }
}

extension moviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.onBind(data: dataList[indexPath.item])
        return cell
    }
}

extension moviesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}

extension moviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath[1])
        performSegue(withIdentifier: "movieSegue", sender: self)
        movieTitle = dataList[indexPath[1]].title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSegue" {
            let destinationVC = segue.destination as! movieDetailsViewController
            
            destinationVC.movieTitle = movieTitle
           // destinationVC.index = index
        }
    }
}
