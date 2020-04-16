//
//  DocumentCell.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/14.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class DocumentCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8
    }
    
    func configure(document: Document) {
        self.titleLabel.text = document.fileURL.lastPathComponent
        //self.setGradientBackgroundColor(colorOne: Colors().randomColors.first!, colorTwo: Colors().randomColors.last!)
        
    }
    
}
