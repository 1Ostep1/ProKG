//
//  GridViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit
import XLPagerTabStrip

class GridViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets
  
  @IBOutlet weak var finalCollView: UICollectionView!
  @IBOutlet weak var gridCollView: UICollectionView!
  
  //MARK: - Properties
  
  private var arr = [
    GridModel(name: "Айбеков Айбек Айбекович", points: "8", image: "Junior", nameOpon: "Айбеков Айбек Айбекович", pointsOpon: "8", imageOpon: "Junior"),
    GridModel(name: "Айбеков Айбек Айбекович", points: "10", image: "Junior", nameOpon: "Айбеков Айбек Айбекович", pointsOpon: "8", imageOpon: "Junior"),
    GridModel(name: "Айбеков Айбек Айбекович", points: "8", image: "Junior", nameOpon: "Айбеков Айбек Айбекович", pointsOpon: "8", imageOpon: "Junior"),
    GridModel(name: "Айбеков Айбек Айбекович", points: "10", image: "Junior", nameOpon: "Айбеков Айбек Айбекович", pointsOpon: "8", imageOpon: "Junior")
  ]
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    cofigureCollViews()
    // Do any additional setup after loading the view.
  }
  //MARK: - Actions
  
  private func cofigureCollViews() {
    finalCollView.delegate = self
    finalCollView.dataSource = self
    gridCollView.delegate = self
    gridCollView.dataSource = self
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Сетка")
  }
  
}
//MARK: - Collection View extensions

extension GridViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == gridCollView {
      return arr.count
    }
    return 5
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == gridCollView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
      let model = arr[indexPath.item]
      cell.configureCell(with: model)  
      cell.makeCircledCorner(with: .init(red: 39/255, green: 37/255, blue: 37/255, alpha: 1), radius: 10)
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "finalCell", for: indexPath)  as! FinalCollectionViewCell
      cell.makeCircledCorner(with: .init(red: 39/255, green: 37/255, blue: 37/255, alpha: 1), radius: 10)
      return cell
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == finalCollView {
      return CGSize(width: 136, height: 93)
    }
    return CGSize(width: collectionView.bounds.width * 0.9, height: 178)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}
