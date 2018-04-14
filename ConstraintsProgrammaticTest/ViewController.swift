//
//  ViewController.swift
//  ConstraintsProgrammaticTest
//
//  Created by Emiko Clark on 4/9/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let squareSide: CGFloat = 100
    var sq1 = Square()
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Animations"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add views
        view.addSubview(titleLabel)
        constrainTitleLabel()
        
        sq1.square.addSubview(sq1.label)
        view.addSubview(sq1.square)
        setupConstraintsSq1(square: sq1)
    }
    
    func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func handleTapForSq1(_ sender: UITapGestureRecognizer) {
        // reset square
        sq1.square.layer.cornerRadius = 0
        sq1.square.backgroundColor = .green
        animateSq1()
    }
    
    func setupConstraintsSq1(square: Square) {
        // add touch gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapForSq1(_:)))
        sq1.square.addGestureRecognizer(tap)
        sq1.square.isUserInteractionEnabled = true
        
         NSLayoutConstraint.activate([
            sq1.square.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50),
            sq1.square.widthAnchor.constraint(equalToConstant: squareSide),
            sq1.square.heightAnchor.constraint(equalToConstant: squareSide),
            sq1.square.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            square.label.widthAnchor.constraint(equalToConstant: 100),
            square.label.centerYAnchor.constraint(equalTo: square.square.centerYAnchor),
            square.label.centerXAnchor.constraint(equalTo: square.square.centerXAnchor)
        ])
    }

    func animateSq1() {
        // transforms sq1 from a green square to a cyan circle upon clicking
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.25, options: [.calculationModePaced], animations: {
            // Add animations

            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq1.square.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq1.square.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
                self.sq1.square.layer.cornerRadius = self.squareSide/2
            })

            UIView.addKeyframe(withRelativeStartTime: 0.5/0.5, relativeDuration: 0.5/0.5, animations: {
                self.sq1.square.backgroundColor = .cyan
            })
        })
    }
}


