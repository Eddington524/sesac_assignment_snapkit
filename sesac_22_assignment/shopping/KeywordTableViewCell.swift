//
//  KeywordTableViewCell.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/29/24.
//

import UIKit

class KeywordTableViewCell: UITableViewCell {

    let icon = UIImageView()
    
    let keywordLabel = UILabel()
    
    let deleteButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(icon)
        contentView.addSubview(keywordLabel)
        contentView.addSubview(deleteButton)
        
        icon.image = UIImage(systemName: "magnifyingglass")
        keywordLabel.textColor = .white
        deleteButton.backgroundColor = .clear
        deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        deleteButton.layer.cornerRadius = 10
        
        icon.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        keywordLabel.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
