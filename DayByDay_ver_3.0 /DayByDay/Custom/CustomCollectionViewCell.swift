//
//  CustomCollectionViewCell.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol CustomCollectionViewCellDelegate: class {
  func removeCell(_ sender: Int) -> Void
}

class CustomCollectionViewCell: UICollectionViewCell {
  static let identifier = "CustomCollectionViewCell"
  
  weak var delegate: CustomCollectionViewCellDelegate?
  
  var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    return label
  }()
  
  var monthLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    return label
  }()
  
  var dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 50, weight: .light)
    return label
  }()
  
  let view: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.460631609, green: 0.8378008604, blue: 0.9999235272, alpha: 1)
    view.layer.cornerRadius = 20
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
    view.layer.shadowOpacity = 0.2
    view.layer.shadowRadius = 4.0
    return view
  }()
  
  let deleteButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "trashwhite"), for: .normal)
    button.addTarget(self, action: #selector(removeButtonDidTap(_:)), for: .touchUpInside)
    return button
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview()
    autoLayout()
    changeColor()
  }
  
  override func draw(_ rect: CGRect) {
    changeColor()
  }
  
  func changeColor() {
    view.backgroundColor = Theme.cardView
    monthLabel.textColor = Theme.cardViewText
    dateLabel.textColor = Theme.cardViewText
    titleLabel.textColor = Theme.cardViewText
  }
  
  func addSubview() {
    contentView.addSubview(view)
    contentView.addSubview(titleLabel)
    contentView.addSubview(monthLabel)
    contentView.addSubview(dateLabel)
    contentView.addSubview(deleteButton)
  }
  
  func autoLayout() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
    view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    
    monthLabel.translatesAutoresizingMaskIntoConstraints = false
    monthLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
    monthLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
    monthLabel.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor).isActive = true
    
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
  }

  
  
  @objc func removeButtonDidTap(_ sender: UIButton) {
    delegate?.removeCell(view.tag)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
