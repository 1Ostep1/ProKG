//
//  MembersViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit
import XLPagerTabStrip 

class MembersViewController: UIViewController, IndicatorInfoProvider {
  
  @IBOutlet weak var allCountLabel: UILabel!
  @IBOutlet weak var menCountLabel: UILabel!
  @IBOutlet weak var womenCountLabel: UILabel!
  @IBOutlet weak var collView: UICollectionView!
  @IBOutlet weak var menCollView: UICollectionView!
  @IBOutlet weak var womenCollView: UICollectionView!
  
  //MARK: - Properties
  
  private var arr = [
    AgeModel(title: "Взрослые", date: "1976-2002", image: "old"),
    AgeModel(title: "Юниоры", date: "2003-2005", image: "Junior"),
    AgeModel(title: "Кадеты", date: "2006-2008", image: "kadet"),
    AgeModel(title: "Дети", date: "2009-2010", image: "child"),
    AgeModel(title: "Дети 8-9 лет", date: "2011-2012", image: "child8"),
    AgeModel(title: "Дети 6-7 лет", date: "2013-2014", image: "child6"),
  ]
  private let arrOfMen = [
    weightCategoryModel(weight: "68", count: "8"),
    weightCategoryModel(weight: "68", count: "8"),
    weightCategoryModel(weight: "68", count: "8"),
    weightCategoryModel(weight: "68", count: "8"),
    weightCategoryModel(weight: "68", count: "8"),
    weightCategoryModel(weight: "68", count: "8"),

  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollView()
    // Do any additional setup after loading the view.
  }
  
  //MARK: - configure Collection View
  
  private func configureCollView() {
    collView.delegate = self
    collView.dataSource = self
    menCollView.delegate = self
    menCollView.dataSource = self
    womenCollView.dataSource = self
    womenCollView.delegate = self
    menCollView.isHidden = true
    womenCollView.isHidden = true
    allCountLabel.isHidden = true
    menCountLabel.isHidden = true
    womenCountLabel.isHidden = true
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Участники")
  }
}
extension MembersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == menCollView {
      return arrOfMen.count
    } else if collectionView == womenCollView {
      return arrOfMen.count
    }else {
      return  arr.count
    }
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == menCollView {
      let cell = menCollView.dequeueReusableCell(withReuseIdentifier: "men", for: indexPath) as! WeightCollectionViewCell 
      let model = arrOfMen[indexPath.item]
      cell.configureCell(model: model)
      cell.makeCircledCorner(with: .clear, radius: 16)
      return cell
    }else if collectionView == womenCollView {
      let cell = womenCollView.dequeueReusableCell(withReuseIdentifier: "women", for: indexPath) as! womenCollectionViewCell
      let model = arrOfMen[indexPath.item]
      cell.configureCell(model: model)
      cell.makeCircledCorner(with: .clear, radius: 16)
      return cell
    }else {
      let cell = collView.dequeueReusableCell(withReuseIdentifier: "type", for: indexPath) as! TypeCompetitionCollectionViewCell
      let model = arr[indexPath.item]
      cell.configureCell(age: model)
      cell.makeCircledCorner(with: .clear, radius: 8)
      return cell
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == menCollView || collectionView == womenCollView {
      return CGSize(width: 90, height: 78)
    }else {
      return CGSize(width: 103, height: 121)
    }
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == collView {
      allCountLabel.isHidden = !allCountLabel.isHidden
      menCountLabel.isHidden = !menCountLabel.isHidden
      womenCountLabel.isHidden = !womenCountLabel.isHidden
      menCollView.isHidden = !menCollView.isHidden
      womenCollView.isHidden = !womenCollView.isHidden
    } else if collectionView == menCollView || collectionView == womenCollView {
      let controller = MembersResultViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
      navigationController?.pushViewController(controller,
                                               animated: true)
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == collView {
      return 5
    }
    return 5 
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  }
}
