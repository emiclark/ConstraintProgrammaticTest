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

//    var sq1 = Square()
    
//    override func loadView() {
//        super.loadView()
//
//        let sq1 = Square()
//
//        // create square
//        self.view.addSubview(sq1.square)
//        sq1.square.addSubview(sq1.label)
//        setupConstraints(square: sq1)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sq1 = Square()
        
        // create square
        self.view.addSubview(sq1.square)
        sq1.square.addSubview(sq1.label)
        setupConstraints(square: sq1)
        
        // add touch gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap( _:, square: Square)))
        sq1.square.addGestureRecognizer(tap)
        sq1.square.isUserInteractionEnabled = true
    }
    
    // function which is triggered when handleTap is called
    
    @objc func handleTap(_ sender: UITapGestureRecognizer, square: Square) {
        // reset square
        square.label.layer.cornerRadius = 16
        square.label.backgroundColor = .green
        setupConstraints(square: square)
        animate(square: square)
    }
    
    func setupConstraints(square: Square) {
        // square constraints
        square.square.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        square.square.widthAnchor.constraint(equalToConstant: squareSide).isActive = true
        square.square.heightAnchor.constraint(equalToConstant: squareSide).isActive = true
        square.square.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            square.label.widthAnchor.constraint(equalToConstant: 250),
            square.label.centerYAnchor.constraint(equalTo: square.square.centerYAnchor),
            square.label.centerXAnchor.constraint(equalTo: square.square.centerXAnchor)
            ])
    }

    func animate(square: Square) {
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModePaced], animations: {
            // Add animations

            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                square.square.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
                square.square.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
                square.square.layer.cornerRadius = self.squareSide/2
            })

            UIView.addKeyframe(withRelativeStartTime: 0.5/1.0, relativeDuration: 0.5/1.0, animations: {
                square.square.backgroundColor = .cyan
            })
        })
    }

}



//======================
//            UIViewPropertyAnimator( duration: 0.5, curve: .easeInOut) {
//                self.square.layer.cornerRadius = self.squareSide/2
//            }.startAnimation()

//======================
//UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModePaced], animations: {
//    // Add animations
//
//    UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
//        self.square.layer.frame.size.width = self.square.layer.frame.size.width + 50
//        self.square.layer.frame.size.height = self.square.layer.frame.size.height + 50
//    })
//
//    UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
//        self.square.layer.frame.size.width = self.square.layer.frame.size.width - 10
//        self.square.layer.frame.size.height = self.square.layer.frame.size.height - 10
//    })
//
//
//  UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/5.0, animations: {
//        self.square.frame.origin.x += 200
//    })
//
//    UIView.addKeyframe(withRelativeStartTime: 1.0/5.0, relativeDuration: 1.0/5.0, animations: {
//        view.backgroundColor = .green
//    })
//    UIView.addKeyframe(withRelativeStartTime: 2.0/5.0, relativeDuration: 1.0/5.0, animations: {
//        view.frame.origin.y += 200
//    })
//    UIView.addKeyframe(withRelativeStartTime: 3.0/5.0, relativeDuration: 1.0/5.0, animations: {
//        view.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
//    })
//    UIView.addKeyframe(withRelativeStartTime: 4.0/5.0, relativeDuration: 1.0/5.0, animations: {
//        view.alpha = 0
//    })
//}, completion:{ _ in
//    print("I'm done!")
//
//})

//==============================================
////
////  ViewController.swift
////  ConstraintsProgrammaticTest
////
////  Created by Emiko Clark on 4/9/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    let squareSide: CGFloat = 300
//
//    var label: UILabel = {
//        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
//        label.font = UIFont(name: "Helvetica", size: 30)
//        label.textAlignment = .center
//        label.textColor = UIColor.red
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Click Me!"
//        return label
//    }()
//
//    var square: UIView = {
//        let sq = UIView()
//        sq.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
//        sq.backgroundColor = UIColor.green
//        sq.translatesAutoresizingMaskIntoConstraints = false
//        return sq
//    }()
//
//    override func loadView() {
//        super.loadView()
//
//        // create square
//        self.view.addSubview(square)
//        self.square.addSubview(label)
//        setupConstraints()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // add touch gesture
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        square.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
//        self.view.addSubview(square)
//    }
//
//    // function which is triggered when handleTap is called
//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        // reset square
//        self.square.layer.cornerRadius = 16
//        self.square.backgroundColor = .green
//        setupConstraints()
//        animate()
//    }
//
//    func setupConstraints() {
//        // square constraints
//        square.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
//        square.widthAnchor.constraint(equalToConstant: squareSide).isActive = true
//        square.heightAnchor.constraint(equalToConstant: squareSide).isActive = true
//        square.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        NSLayoutConstraint.activate([
//            label.widthAnchor.constraint(equalToConstant: 250),
//            label.centerYAnchor.constraint(equalTo: square.centerYAnchor),
//            label.centerXAnchor.constraint(equalTo: square.centerXAnchor)
//            ])
//    }
//
//    func animate() {
//
//        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModePaced], animations: {
//            // Add animations
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
//                self.square.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0/0.0, relativeDuration: 0.0/0.25, animations: {
//                self.square.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0/0.25, relativeDuration: 0.0/0.25, animations: {
//                self.square.layer.cornerRadius = self.squareSide/2
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.5/1.0, relativeDuration: 0.5/1.0, animations: {
//                self.square.backgroundColor = .cyan
//            })
//        })
//    }
//
//}
//


