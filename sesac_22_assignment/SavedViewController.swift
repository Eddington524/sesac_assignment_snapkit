//
//  SavedViewController.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/28/24.
//

import UIKit

class SavedViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "'나만의 자동 저장' 기능"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = "취향에 맞는 영화롸 시리즈를 자동으로 저장해드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    let circleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 100
        
        return view
    }()
    
    let firstimageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "범죄도시3")
        
        return view
    }()
    
    let secondimageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "범죄도시3")
        view.transform = .init(rotationAngle: 30.0/180)
       
        return view
    }()
    
    let thirdimageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "범죄도시3")
        view.transform = .init(rotationAngle: -30.0/180)
        
        return view
    }()
    
    let settingButton: UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = .systemBlue
        btn.setTitle("설정하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 10
    
        return btn
    }()
    
    let subButton: UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = .white
        btn.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        setBackground()
        setupConstraints()
        setNavigationItem(titleName: "저장한 콘텐츠 목록")
    }
    
    func configureHierarchy() {
        [titleLabel,subLabel,circleView,thirdimageView,secondimageView,firstimageView,settingButton,subButton].forEach { view.addSubview($0)
        }
   
    }
    
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        circleView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        firstimageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        secondimageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(130)
            make.leading.equalTo(firstimageView.snp.trailing).offset(-20)
            make.bottom.equalTo(firstimageView)
        }
        
        thirdimageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(130)
            make.trailing.equalTo(firstimageView.snp.leading).inset(20)
            make.bottom.equalTo(firstimageView)
        }

        settingButton.snp.makeConstraints { make in
            make.top.equalTo(circleView.snp.bottom).offset(80)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        }
        
        subButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }

}


//#Preview {
//    SavedViewController()
//}

