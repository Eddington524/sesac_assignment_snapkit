//
//  ShoppingViewController.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/29/24.
//

import UIKit

class ShoppingViewController: UIViewController {

    let keywords = ["맥북 거치대",
                    "레오폴드 저소음 적축",
                    "나이키 러닝화",
                    "아이폰 15 256",
                    "뉴발란스",
                    "카드지갑"]
    
    let tableView = UITableView()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchTextField.backgroundColor = .darkGray
        bar.backgroundColor = .darkGray
        bar.searchTextField.leftView?.tintColor = .lightGray
        bar.barTintColor = .clear
        bar.placeholder = "브랜드,상품,프로필,태그 등"
        return bar
    }()
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 검색"
        label.textColor = .white
        return label
    }()
    
    let resetButton: UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = .clear
        btn.setTitle("모두 지우기", for: .normal)
        btn.setTitleColor(.green, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)

        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        configureHierarchy()
        setupConstraints()
        configureView()
        setNavigationItem(titleName: "떠나고싶은 고래밥님의 새싹쇼핑")
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(leftLabel)
        view.addSubview(resetButton)
        view.addSubview(tableView)
    }
    
    func configureView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(KeywordTableViewCell.self, forCellReuseIdentifier: "KeywordTableViewCell")
        
        tableView.backgroundColor = .clear
        tableView.rowHeight = 40
    }
  
    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(36)
            
        }
        
        leftLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }
        
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(8)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(70)
            make.horizontalEdges.bottom.equalToSuperview().inset(20)
        }
        
    }
    

}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KeywordTableViewCell") as! KeywordTableViewCell
        
        cell.icon.tintColor = .white
        cell.deleteButton.tintColor = .white
        cell.backgroundColor = .clear
        cell.keywordLabel.text = keywords[indexPath.row]
        cell.keywordLabel.textColor = .white
        return cell
    }
    
}

//#Preview {
//    ShoppingViewController()
//}

