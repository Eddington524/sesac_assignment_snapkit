//
//  ViewController.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/26/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let posterImage: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "서울의봄", "스즈메의 문단속", "아바타물의길", "오펜하이머", "육사오"]
    
    let taglist: [String] = ["응원하고픈", "흥미진진", "전투", "한국작품"]
    
    let topView = UIView()
    let mainImageView = UIImageView()
    let mainTagLabel = UILabel()
    lazy var stackView = UIStackView()
    let playButton = UIButton()
    let addListButton = UIButton()
    lazy var posterStackView = UIStackView()
    
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    let nowLabel = UILabel()
    let topTenButton = UIButton()
    let stackPlayButton = UIButton()
    let stackSeriesButton = UIButton()
    let stackEpisodButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        setBackground()
        configureView()
        configureNavigation()
        setupConstraints()
        setNavigationItem(titleName: "고래밥님")
    }
    
    func configureHierarchy(){
        
        //view
        [topView,mainTagLabel,nowLabel,posterStackView].forEach {
            view.addSubview($0)
        }
    
        //topview
        [mainImageView,stackView].forEach {
            topView.addSubview($0)
        }
    
        //stackview
        [playButton,addListButton].forEach {
            stackView.addArrangedSubview($0)
        }

        //posterStackview
        let imageList = [firstImageView,secondImageView,thirdImageView]
       
        for (idx, item) in imageList.enumerated() {
            item.tag = idx
        }
        
        imageList.forEach {
            posterStackView.addArrangedSubview($0)
            
            if $0.tag == 0 {
                $0.addSubview(stackEpisodButton)
            }else if $0.tag == 1{
                $0.addSubview(topTenButton)
                $0.addSubview(stackPlayButton)
            }else{
                $0.addSubview(stackSeriesButton)
            }
        }
    }
    
    func configureView(){

        topView.clipsToBounds = true
        topView.layer.cornerRadius = 20
        mainImageView.image = UIImage(named:"범죄도시3")
        mainImageView.contentMode = .scaleAspectFill
        
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        posterStackView.axis = .horizontal
        posterStackView.spacing = 4
        posterStackView.distribution = .fillEqually
        
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
       
        firstImageView.image = UIImage(named:posterImage[5])
        secondImageView.image = UIImage(named:posterImage[6])
        thirdImageView.image = UIImage(named:posterImage[7])
        
        [firstImageView,secondImageView,thirdImageView].forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
        
        [stackSeriesButton,topTenButton,stackEpisodButton,stackPlayButton].forEach {
            $0.backgroundColor = .red
            $0.layer.cornerRadius = 5
            $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
        }
       
        stackPlayButton.backgroundColor = .white
        stackPlayButton.setTitle("지금 시청하기", for: .normal)
        stackPlayButton.setTitleColor(.black, for: .normal)
        stackSeriesButton.setTitle("새로운 시리즈", for: .normal)
        topTenButton.setImage(UIImage(named: "top10 badge"), for: .normal)
        stackEpisodButton.setTitle("새로운 에피소드", for: .normal)
        
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
            make.bottom.equalTo(topView).offset(32)
        }
        
        posterStackView.snp.makeConstraints { make in
            make.top.equalTo(nowLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(190)
        }
        
        topTenButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        lazy var buttonsList = [stackPlayButton,stackEpisodButton,stackSeriesButton]
        
        buttonsList.forEach {
            $0.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview().inset(20)
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
            }
        }
       
    }
    
    func configureNavigation(){
        navigationItem.title = "송태섭님"
        navigationController?.navigationBar.barTintColor = .black
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

//#Preview {
//    MainViewController()
//}
