//
//  PickImageCell.swift
//  DashboardApp
//
//  Created by Prateek's mac mini on 03/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import UIKit

class PickImageCell: UICollectionViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}


