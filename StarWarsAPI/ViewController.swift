//
//  ViewController.swift
//  StarWarsAPI
//
//  Created by Unsal Oner on 4.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ViewModel()
    
    var listViewModel = [ListViewModel]()
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collection.dataSource = self
        collection.delegate = self
        
        viewModel.fetchPeople { people in
                    if let people = people {
                        self.listViewModel = people.results.map({ListViewModel(person: $0)})
                        DispatchQueue.main.async {
                            self.collection.reloadData()
                        }
                    }
                }
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: "cell")
            }
        }
    

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let personViewModel = listViewModel[indexPath.item]
        cell.nameLabel.text = "Name: " + personViewModel.name
        cell.heightLabel.text = "Height: " + personViewModel.height
        cell.homeworldLabel.text = "Birthday: " + personViewModel.birthYear
        cell.genderLabel.text = "Gender: " + personViewModel.gender.rawValue
        return cell
    }
}

