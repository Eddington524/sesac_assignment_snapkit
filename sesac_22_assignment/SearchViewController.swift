//
//  SearchViewController.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/27/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    let buttonTitleList = ["공개예정", "모두의 인기콘텐츠", "TOP 10시리즈"]
    let buttonImgList = ["blue", "turquoise", "pink"]
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchTextField.backgroundColor = .darkGray
        bar.backgroundColor = .darkGray
        bar.searchTextField.leftView?.tintColor = .lightGray
        bar.barTintColor = .clear
        bar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        return bar
    }()
    
    
//    let stackView = UIStackView()
    let buttonsView = UIView()
    
    
    let oneButton: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 4, bottom: 10, trailing: 4)
    
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.boldSystemFont(ofSize: 14)
        titleContainer.foregroundColor = UIColor.black

        configuration.attributedTitle = AttributedString("공개예정", attributes: titleContainer)
        configuration.image = UIImage(named: "blue")
        
        btn.configuration = configuration
        
        return btn
    }()
    
    let twoButton: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 4, bottom: 10, trailing: 4)
    
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 12
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.boldSystemFont(ofSize: 14)
        titleContainer.foregroundColor = UIColor.white

        configuration.attributedTitle = AttributedString("모두의 인기콘텐츠", attributes: titleContainer)
        configuration.image = UIImage(named: "turquoise")
        
        btn.configuration = configuration
        
        return btn
    }()
    
    let threeButton : UIButton = {
        
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 4, bottom: 10, trailing: 4)
    
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 12
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.boldSystemFont(ofSize: 14)
        titleContainer.foregroundColor = UIColor.white

        configuration.attributedTitle = AttributedString("TOP 10시리즈", attributes: titleContainer)
        configuration.image = UIImage(named: "pink")
        
        btn.configuration = configuration
        return btn
    }()
    
    
    let noSearchLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이런! 찾으시는 작품이 없습니다."
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    let noSearchSubLabel: UILabel = {
        let label = UILabel()
        
        label.text = "다른 영화, 시리즈, 배우,감독 또는 장르를 검색해보세요."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    
//    let nav = UINavigationController(rootViewController: SearchViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        configureHierarchy()
        setupConstraints()
        setNavigationItem(titleName: "NEW & HOT검색")
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(buttonsView)
        view.addSubview(noSearchLabel)
        view.addSubview(noSearchSubLabel)
        
        let buttonList = [oneButton,twoButton,threeButton]
       
        for (idx, item) in buttonList.enumerated() {
            item.tag = idx
        }
        
        buttonList.forEach {
            buttonsView.addSubview($0)
        }
    }
    
//    func configureView(){
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        stackView.alignment = .fill
//        stackView.distribution = .equalSpacing
//
//    }
    
    func setupConstraints() {
     
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(36)
            
        }
        
        buttonsView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)

            make.height.equalTo(30)
        }
        
        oneButton.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(oneButton.titleLabel!.snp.width)
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
                }
        
        twoButton.snp.makeConstraints { make in
                    make.width.greaterThanOrEqualTo(twoButton.titleLabel!.snp.width)
            make.leading.equalTo(oneButton.snp.trailing).offset(16)
            make.verticalEdges.equalToSuperview()
                }
        
        threeButton.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(threeButton.titleLabel!.snp.width)
            
            make.leading.equalTo(twoButton.snp.trailing).offset(16)
            make.verticalEdges.equalToSuperview()
            
            make.trailing.equalToSuperview()
                }
        
        noSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonsView.snp.bottom).offset(150)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        noSearchSubLabel.snp.makeConstraints { make in
            make.top.equalTo(noSearchLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
    }
}

//#Preview {
//    SearchViewController()
//}
