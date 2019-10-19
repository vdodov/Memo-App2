//
//  DateTableViewCell.swift
//  DayByDay
//
//  Created by 차수연 on 18/10/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
  static let identifier = "DateTableViewCell"
  
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "FRI. OCT 18 / 2019"
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(dateLabel)
    
    dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
