//
//  FilteredCompViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class FilteredCompViewController: UIViewController {

  //MARK: - Outlets
  @IBOutlet weak var filterCollView: UICollectionView!
  
  //MARK: - Properties
  private let arr: [FilterModel] = [
    FilterModel(name: "Национальный виды спорта", image: "child"),
    FilterModel(name: "Олимпийский виды спорта", image: "child"),
    FilterModel(name: "Неолимпийские виды спорта", image: "child"),
    FilterModel(name: "Виды спорта Пара и Сурдро(ЛОВЗ)", image: "child"),
  ]
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollView()
    setupBackButton()
  }
  
  //MARK: - Actions
  
  private func configureCollView() {
    filterCollView.delegate = self
    filterCollView.dataSource = self
    filterCollView.register(UINib(nibName: FilterCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
  }
}
//MARK: - Collection View extension
extension FilteredCompViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
    let model = arr[indexPath.row]
    cell.configure(model: model)
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let controller = DetailFilterCompTableViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    controller.title = arr[indexPath.row].name
    navigationController?.pushViewController(controller, animated: true)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 2 - 10, height: 100)
  }
}
