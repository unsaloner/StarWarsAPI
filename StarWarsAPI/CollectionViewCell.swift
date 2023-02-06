//
//  CollectionViewCell.swift
//  StarWarsAPI
//
//  Created by Unsal Oner on 6.02.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    
    @IBOutlet weak var homeworldLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameLabel.numberOfLines = 0
        heightLabel.numberOfLines = 0
        genderLabel.numberOfLines = 0
        homeworldLabel.numberOfLines = 0
        
    }
    
    

}
