//
//  ViewController.swift
//  CardSliderDemo
//
//  Created by Mohamed El-Said on 7/31/19.
//  Copyright © 2019 Mohamed El-Said. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var images: [String] = ["1", "2", "3","4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.reloadData()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.layoutIfNeeded()

    }
}
extension ViewController: UICollectionViewDelegate {
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        return cell
    }
    
    
}
