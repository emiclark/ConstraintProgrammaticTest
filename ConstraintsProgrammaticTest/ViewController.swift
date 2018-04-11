//
//  ViewController.swift
//  ConstraintsProgrammaticTest
//
//  Created by Emiko Clark on 4/9/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let squareSide: CGFloat = 300

    var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
        label.font = UIFont(name: "Helvetica", size: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Click Me!"
        return label
    }()
    
    var square: UIView = {
        let sq = UIView()
        sq.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        sq.backgroundColor = UIColor.green
        sq.translatesAutoresizingMaskIntoConstraints = false
        return sq
    }()
    
    override func loadView() {
        super.loadView()
 
        // create square
        self.view.addSubview(square)
        self.square.addSubview(label)
        setupConstraints()
    }
    
    func setupConstraints() {
        // square constraints
        square.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        square.widthAnchor.constraint(equalToConstant: squareSide).isActive = true
        square.heightAnchor.constraint(equalToConstant: squareSide).isActive = true
        square.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 250),
            label.centerYAnchor.constraint(equalTo: square.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: square.centerXAnchor)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add touch gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        square.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        self.view.addSubview(square)
    }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // animate square
        self.square.layer.cornerRadius = 16
        UIViewPropertyAnimator( duration: 0.5, curve: .easeInOut) {
            self.square.layer.cornerRadius = self.squareSide/2
        }.startAnimation()
    }


}

