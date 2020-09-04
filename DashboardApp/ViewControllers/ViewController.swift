//
//  ViewController.swift
//  DashboardApp
//
//  Created by Prateek's mac mini on 03/09/20.
//  Copyright © 2020 Prateek's mac mini. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    var selectedImage : UIImage!
    var imagePicker: ImagePicker!
    
    //MARK : - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitials()
    }
    
    //update layout of collectionview cell on rotation
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
        return
      }
        let itemWidth = kIsLandscape ? ((collectionView.frame.width - 50) / 3) : collectionView.frame.width
        let itemHeight = kIsLandscape ? self.view.frame.height * 0.8 : self.view.frame.height * 0.6
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
      flowLayout.invalidateLayout()
    }
    
    //MARK: - Private funcs
    private func setupInitials(){
        self.title = kHome
        self.collectionView.register(UINib(nibName: String(describing: PieChartCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PieChartCell.self))
        self.collectionView.register(UINib(nibName: String(describing: ColumnChartCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ColumnChartCell.self))
        self.collectionView.register(UINib(nibName: String(describing: PickImageCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PickImageCell.self))
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    // Button Actions
    @objc func captureButtonAction(sender: UIButton){
         self.imagePicker.present(from: sender)
    }
    
    @objc func cancelButtonAction(sender: UIButton){
        self.selectedImage = nil
        self.collectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PieChartCell.self), for: indexPath) as! PieChartCell
            cell.ConfigureCell(dataPoints: months, values: unitsSold)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColumnChartCell.self), for: indexPath) as! ColumnChartCell
            cell.ConfigureCell(dataPoints: months, values: unitsSold)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PickImageCell.self), for: indexPath) as! PickImageCell
            cell.imageView.image = self.selectedImage
            cell.captureButton.addTarget(self, action: #selector(captureButtonAction), for: .touchUpInside)
            cell.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
            return cell
        }
    }
    
}

//MARK: - UICollectionViewDelegate
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = kIsLandscape ? ((collectionView.frame.width - 50) / 3) : collectionView.frame.width
        let itemHeight = kIsLandscape ? self.view.frame.height * 0.6 : self.view.frame.height * 0.6
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

//MARK: - Custom Image Picker Delegates
extension ViewController : ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.selectedImage = image
        self.collectionView.reloadData()
    }
}
