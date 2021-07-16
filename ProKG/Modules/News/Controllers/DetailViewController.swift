//
//  DetailViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/22/21.
//

import UIKit

class DetailViewController: UIViewController {
  
  //MARK: - Outlet
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  //MARK: - Properties
  
  private var titl = ""
  private var date = ""
  private var image = ""
  private var desc = ""
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageLabel.setShadowOffset()
    descriptionLabel.setLineSpacing(lineSpacing: 10)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    titleLabel.text = titl
    dateLabel.text = date
    //    imageLabel.downloadImage(with: image)
    imageLabel.image = UIImage(named: "basketball")
    descriptionLabel.text = desc
  }
  //MARK: - Configure View
  
  func configure(_ cell: NewsModel) {
    titl = cell.title ?? "NO TITLE"
    date = cell.createdAt ?? "NO DATE"
    image = cell.image ?? ""
    desc = cell.text ?? "NO DESCRIPTION"
  }
}
