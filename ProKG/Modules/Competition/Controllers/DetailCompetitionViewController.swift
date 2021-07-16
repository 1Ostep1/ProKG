//
//  CompetitionFilterViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/26/21.
//

import UIKit
import XLPagerTabStrip

class DetailCompetitionViewController: ButtonBarPagerTabStripViewController {
  override func viewDidLoad() {
    setupBackButton(with: "Назад")
    setupTransparentNavigationBar()
    settings.style.buttonBarBackgroundColor = .black
    settings.style.buttonBarItemBackgroundColor = .clear
    settings.style.selectedBarBackgroundColor = .red
    settings.style.buttonBarItemFont = UIFont(name: "Oswald-Regular", size: 16)!
    settings.style.selectedBarHeight = 2
    settings.style.buttonBarMinimumLineSpacing = 0
    settings.style.buttonBarItemTitleColor = .white
    settings.style.buttonBarItemsShouldFillAvailableWidth = true
    settings.style.buttonBarMinimumInteritemSpacing = 2
    settings.style.buttonBarItemLeftRightMargin = 30
    super.viewDidLoad()
  }
  override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let reglamentController = ReglamentViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    let teamController = TeamViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    let membersController = MembersViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    let gridController = GridViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    let resultsController = ResultsViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    return [reglamentController, teamController, membersController, gridController, resultsController]
  }
}
