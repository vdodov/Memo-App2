//
//  ContentTableViewCell.swift
//  DayByDay
//
//  Created by 차수연 on 18/10/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
  static let identifier = "ContentTableViewCell"
  
  
  let contentLabel: UILabel = {
    let label = UILabel()
    label.text = "content LAbel.."
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(contentLabel)
    
    contentLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
