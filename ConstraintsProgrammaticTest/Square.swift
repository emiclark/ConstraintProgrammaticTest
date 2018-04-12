//
//  Square.swift
//  ConstraintsProgrammaticTest
//
//  Created by Emiko Clark on 4/11/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit


class Square {

    var square: UIView = {
        let sq = UIView()
        sq.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        sq.backgroundColor = UIColor.green
        sq.translatesAutoresizingMaskIntoConstraints = false
        return sq
    }()
    
    
    var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
        label.font = UIFont(name: "Helvetica", size: 30)
        label.textAlignment = .center
        label.textColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Click Me!"
        return label
    }()
    
    
}
