//
//  SettingViewController.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  
  // MARK: - Properties
  
  let topView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "설정"
    label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.tableFooterView = UIView() //여백추가하기 위함
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUserInterface()
    configureConstraints()
  }
  
  
  // MARK: - configuration
  private func configureUserInterface() {
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  
    view.addSubview(topView)
    topView.addSubview(titleLabel)
    
    view.addSubview(tableView)
    
  
   
  }
  
  private func configureConstraints() {
    let guide = view.safeAreaLayoutGuide
    
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.12).isActive = true
    
    titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 5).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5).isActive = true
    
    tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
  
}

// MARK: - tableView dataSource extension
extension SettingViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "테마선택"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return themeName.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.selectionStyle = .none
    cell.textLabel?.text = themeName[indexPath.row]
    
    return cell
  }
  
  
}

// MARK: - tableView delegate extension
extension SettingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    
    
    switch indexPath.row {
      
    case 0:
      UserDefaults.standard.set(0, forKey: "myThema")
      Theme.defaultTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 1:
      UserDefaults.standard.set(1, forKey: "myThema")
      Theme.darkBlueTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 2:
      UserDefaults.standard.set(2, forKey: "myThema")
      Theme.pinkTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 3:
      UserDefaults.standard.set(3, forKey: "myThema")
      Theme.violetTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 4:
      UserDefaults.standard.set(4, forKey: "myThema")
      Theme.greenTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 5:
      UserDefaults.standard.set(5, forKey: "myThema")
      Theme.grayTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    case 6:
      UserDefaults.standard.set(6, forKey: "myThema")
      Theme.yellowTheme()
      
      tabBarController?.tabBar.tintColor = Theme.tabBarBarTint
      tabBarController?.tabBar.barTintColor = Theme.tabBarTint
      tabBarController?.tabBar.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
    default:
      break
    }
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
  }
}


