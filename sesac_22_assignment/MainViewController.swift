//
//  ViewController.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/26/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let taglist: [String] = ["응원하고픈", "흥미진진", "전투", "한국작품"]
    
    let topView = UIView()
    let mainImageView = UIImageView()
    let mainTagLabel = UILabel()
    lazy var stackView = UIStackView()
    let playButton = UIButton()
    let addListButton = UIButton()
    
    let nowLabel = UILabel()
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        setBackground()
        configureView()
        configureNavigation()
        setupConstraints()
    }
    
    func configureHierarchy(){
        view.addSubview(topView)
        topView.addSubview(mainImageView)
        topView.addSubview(stackView)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(addListButton)

        topView.addSubview(mainTagLabel)
        topView.addSubview(nowLabel)
//        topView.addSubview(playButton)
//        topView.addSubview(addListButton)
    }
    
    func configureView(){
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 20
        mainImageView.image = UIImage(named:"범죄도시3")
        mainImageView.contentMode = .scaleAspectFill
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        playButton.tintColor = .black
        playButton.setTitleColor(.black, for: .normal)
        
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 10
        playButton.setTitle("재생", for: .normal)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        addListButton.backgroundColor = .darkGray
        addListButton.layer.cornerRadius = 10
        addListButton.setTitle("내가 찜한 리스트", for: .normal)
    
        mainTagLabel.text = "\(taglist[0])·\(taglist[1])·\(taglist[2])·\(taglist[3])"
        mainTagLabel.textColor = .white
        
        nowLabel.text = "지금 뜨는 콘텐츠"
        nowLabel.textColor = .white
    }
    
    func setupConstraints(){
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(450)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        playButton.snp.makeConstraints { make in
            make.height.equalTo(32)

        }
        
        mainTagLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView).inset(-32)
            make.centerX.equalToSuperview()
            
        }
        
        nowLabel.snp.makeConstraints { make in
            make.top.bottomMargin
        }

    }
    
    func configureNavigation(){
        navigationItem.title = "송태섭님"
        navigationController?.navigationBar.barTintColor = .black
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

#Preview {
    MainViewController()
}
