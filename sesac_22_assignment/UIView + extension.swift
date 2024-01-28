//
//  UIView + extension.swift
//  sesac_22_assignment
//
//  Created by Sammy Jung on 1/26/24.
//

import UIKit

extension UIViewController {
    
    func setBackground(){
        view.backgroundColor = .black
    }
  
    func setNavigationItem(titleName: String)-> Void {
            
            navigationItem.title = titleName
            navigationController?.navigationBar.tintColor = .white
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.topItem?.title = ""
    }

}
