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
    
    var subject = UILabel()
    var registerDate = UILabel()
    let view = UIView()
    let removeButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview()
        autoLayout()
        configure()
        changeColor()
    }
    
    override func draw(_ rect: CGRect) {
        changeColor()
    }
    
    func changeColor() {
        view.backgroundColor = Theme.cardView
        registerDate.textColor = Theme.cardViewText
        subject.textColor = Theme.cardViewText
    }
    
    func addSubview() {
        contentView.addSubview(view)
        contentView.addSubview(subject)
        contentView.addSubview(registerDate)
        contentView.addSubview(removeButton)
    }
    
    func autoLayout() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        subject.translatesAutoresizingMaskIntoConstraints = false
        subject.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subject.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        subject.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        subject.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        subject.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        registerDate.translatesAutoresizingMaskIntoConstraints = false
        registerDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        registerDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        registerDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        registerDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func configure() {
        view.backgroundColor = #colorLiteral(red: 0.460631609, green: 0.8378008604, blue: 0.9999235272, alpha: 1)
        
        view.layer.cornerRadius = 20
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        
        subject.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subject.textAlignment = .center
        subject.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        registerDate.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        removeButton.setImage(UIImage(named: "trashwhite"), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonDidTap(_:)), for: .touchUpInside)
    }
    
    
    @objc func removeButtonDidTap(_ sender: UIButton) {
        delegate?.removeCell(view.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
