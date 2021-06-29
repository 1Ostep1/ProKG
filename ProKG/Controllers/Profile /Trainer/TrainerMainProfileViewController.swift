//
//  TrainerMainProfileViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 22/6/21.
//

import UIKit
import XLPagerTabStrip

class TrainerMainProfileViewController: ButtonBarPagerTabStripViewController {
  //MARK: - Outlets
  
  @IBOutlet weak var imageView: UIImageView!
  
  //MARK: - Properties
  var name = "Aibek"
  var surname = "Aibek"
  
  override func viewDidLoad() {
    setupTransparentNavigationBar()
    settings.style.buttonBarBackgroundColor = .black
    settings.style.buttonBarItemBackgroundColor = .clear
    settings.style.selectedBarBackgroundColor = .red
    settings.style.buttonBarItemFont = UIFont(name: "Oswald", size: 16)!
    settings.style.selectedBarHeight = 2
    settings.style.buttonBarMinimumLineSpacing = 0
    settings.style.buttonBarItemTitleColor = .white
    settings.style.buttonBarItemsShouldFillAvailableWidth = true
    settings.style.buttonBarMinimumInteritemSpacing = 2
    settings.style.buttonBarItemLeftRightMargin = 30
    super.viewDidLoad()
    imageView.layer.cornerRadius = 40
    setDefaultImage(name: name, surname: surname, image: imageView)
  }
  override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let dataController = DataTrainerViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    let compTrainerController = CompetitionTrainerViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    let spotsmenController = SportsmenTrainerViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    return [dataController, compTrainerController, spotsmenController]
  }
}
