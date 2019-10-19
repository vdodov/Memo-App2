//
//  DetailViewController.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Properties
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  var savedData: MemoData?
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  //Date and Content
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.tableFooterView = UIView()
    tableView.separatorStyle = .none
    tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.identifier)
    tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: ContentTableViewCell.identifier)
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  let bottomView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let menuButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
    button.addTarget(self, action: #selector(didTapMenuButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  let dismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
    button.addTarget(self, action: #selector(didTapDismissButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    
    //naviBar 숨김
    
    configureUserInterface()
    configureConstraints()
    showSavedUserInputData()
  }
  
  // MARK: - configuration
  private func configureUserInterface() {
    tableView.dataSource = self
    
    view.addSubview(imageView)
    view.addSubview(tableView)
    view.addSubview(bottomView)
    view.addSubview(label)
    
    bottomView.addSubview(menuButton)
    bottomView.addSubview(dismissButton)
  }
  
  private func configureConstraints() {
    let guide = view.safeAreaLayoutGuide
    
    imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4).isActive = true
    
    tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    
    bottomView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.05).isActive = true
    
    label.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
    label.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    label.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    menuButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
    menuButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20).isActive = true
    menuButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
    menuButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
    menuButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    dismissButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
    dismissButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20).isActive = true
    dismissButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
    dismissButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    dismissButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
  }
  
  // MARK: - Action method
  private func showSavedUserInputData() {
    imageView.image = savedData?.image
    
  }
  
  
  @objc private func didTapMenuButton(_ sender: UIButton) {
    print("didTapMenuButton")
    
    let actionSheet = UIAlertController(title: "", message: "원하는 메뉴를 선택해주세요.", preferredStyle: .actionSheet)
    let modifyAction = UIAlertAction(title: "수정하기", style: .default) { (_) in
      print("수정하기")
    }
    let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive) { (_) in
      print("삭제하기")

      
    }
    let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
      print("취소하기")
    }
    
    actionSheet.addAction(modifyAction)
    actionSheet.addAction(deleteAction)
    actionSheet.addAction(cancelAction)
    present(actionSheet, animated: true)
    
  }
  
  @objc private func didTapDismissButton(_ sender: UIButton) {
    print("didTapDismissButton")
    dismiss(animated: false, completion: nil)
  }
}


extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
      // 날짜 포맷 변환
      let formatter = DateFormatter()
      formatter.dateFormat = "EEE. MMM dd / yyyy "
      //FRI. OCT 18 / 2019
      let dateString = formatter.string(from: (savedData?.registerDate)!)
      let upper = dateString.uppercased()
      
      // 레이블에 날짜 표시 -> 대문자로
      cell.dateLabel.text = upper
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath) as! ContentTableViewCell
      cell.contentLabel.text = savedData?.contents
      return cell
    default:
      fatalError()
    }
  }
  
  
}
