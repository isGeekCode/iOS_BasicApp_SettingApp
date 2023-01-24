//
//  ViewController.swift
//  SettingApp_Clone
//
//  Created by hyeonseok on 2023/01/23.
//

import UIKit

class MainViewController: UIViewController {

  //MARK: Properties
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    label.textColor = .darkGray

    return label
  }()
  
    lazy var searchBar: UISearchBar = {
      let searchBar = UISearchBar()
//        $0.placeholder = ""
      searchBar.searchTextField.tintColor = .black
      searchBar.searchBarStyle = .minimal
      searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
      searchBar.setImage(UIImage(named: "icSearchNonW"), for: .search, state: .normal)
      return searchBar
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setLayouts()
    setupConstraints()
    setupStyles()

  }

  private func setLayouts() {
    [titleLabel, searchBar].forEach {
      self.view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
      titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25),

      searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      searchBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
      searchBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
      searchBar.heightAnchor.constraint(equalToConstant: 35),
    ])
  }
  
  private func setupStyles() {
    self.view.backgroundColor = .systemGray6
    titleLabel.text = "설정"
    
    guard let textfield = searchBar.value(forKey: "searchField") as? UITextField else { return }

    textfield.backgroundColor = .systemGray6
    textfield.textColor = .black
    textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "검색", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])

    //왼쪽 아이콘 이미지넣기
    if let leftView = textfield.leftView as? UIImageView {
        leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
        leftView.tintColor = .black
    }

    //오른쪽 x버튼 이미지넣기
    if let rightView = textfield.rightView as? UIImageView {
        rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
    }
  }

  // TODO: SearchBar SearchContainerView padding조절하기
  // searchBar의 leading을 제어할 수 있도록 처리할 것
}

