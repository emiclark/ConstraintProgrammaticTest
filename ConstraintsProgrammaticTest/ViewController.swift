//
//  ViewController.swift
//  ConstraintsProgrammaticTest
//
//  Created by Emiko Clark on 4/9/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properties
    let squareSide: CGFloat = 100
    var sq1 = Square()
    var sq2 = Square()
    var spacing: CGFloat = 0
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Animations"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllViews()
    }
    
    func setupAllViews() {
        // add Title
        view.addSubview(titleLabel)
        constrainTitleLabel()
        
        // add sq1
        sq1.square.tag = 1
        sq1.label.text = "To Circle"
        sq1.square.addSubview(sq1.label)
        view.addSubview(sq1.square)
        spacing += 50
        setupConstraints(square: sq1, belowView: sq1)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTapForSq1(_:)))
        sq1.square.addGestureRecognizer(tap1)

        // add sq2
        sq2.square.tag = 1
        sq2.label.text = "Pulse"
        sq2.square.addSubview(sq2.label)
        self.sq2.label.textColor = UIColor.white
        sq2.square.backgroundColor = UIColor.red
        view.addSubview(sq2.square)
        spacing += squareSide + squareSide * 0.25
        setupConstraints(square: sq2, belowView: sq1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTapForSq2(_:)))
        sq2.square.addGestureRecognizer(tap2)
    }
    
    // MARK:- sq1 Methods
    @objc func handleTapForSq1(_ sender: UITapGestureRecognizer) {
        // reset square
        sq1.square.layer.cornerRadius = 0
        sq1.square.backgroundColor = .green
        animateSq1()
    }
    
    func animateSq1() {
        // transforms sq1 from a green square to a cyan circle upon clicking
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.1, options: [.calculationModePaced], animations: {
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
    
    // MARK:- sq2 Methods
    @objc func handleTapForSq2(_ sender: UITapGestureRecognizer) {
        // reset square
        sq2.square.layer.cornerRadius = 0
        sq2.square.backgroundColor = .red
        animateSq2()
    }
    
    func animateSq2() {
        // transforms sq2 from a green square to a cyan circle and then pulses 2x
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.1, options: [.calculationModePaced], animations: {
            // Add animations
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq2.square.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq2.square.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
                self.sq2.square.layer.cornerRadius = self.squareSide/2
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5/0.5, relativeDuration: 0.5/0.5, animations: {
                self.sq2.square.backgroundColor = .red
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq2.square.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                self.sq2.square.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            })
        })
    }
    
    // MARK:- Helper Methods
    func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupConstraints(square: Square, belowView: Square) {
        // add touch gesture
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapForSq1(_:)))
//                square.square.addGestureRecognizer(tap)
        square.square.isUserInteractionEnabled = true
        
        if belowView.square.tag == 1 {
            // constrain square below titleLabel
            NSLayoutConstraint.activate([
                square.square.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(spacing)),
                square.square.widthAnchor.constraint(equalToConstant: squareSide),
                square.square.heightAnchor.constraint(equalToConstant: squareSide),
                square.square.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        } else {
            // constrain square below previous square
            NSLayoutConstraint.activate([
                square.square.topAnchor.constraint(equalTo: belowView.square.bottomAnchor, constant: CGFloat(self.spacing)),
                square.square.widthAnchor.constraint(equalToConstant: squareSide),
                square.square.heightAnchor.constraint(equalToConstant: squareSide),
                square.square.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }

        NSLayoutConstraint.activate([
            square.label.widthAnchor.constraint(equalToConstant: 100),
            square.label.centerYAnchor.constraint(equalTo: square.square.centerYAnchor),
            square.label.centerXAnchor.constraint(equalTo: square.square.centerXAnchor)
        ])
    }
}


