//
//  ViewController.swift
//  YeahOrNah
//
//  Created by Mike Camara on 2/4/20.
//  Copyright © 2020 Mike Camara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.style = .large
        activityIndicator.color = .secondaryLabel
        activityIndicator.isHidden = true
        shakeLabel.text = yesOrNo()
        shakeLabel.sizeToFit()
        shakeLabel.adjustsFontSizeToFitWidth = true
        shakeLabel.textAlignment = .center
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction(sender:)))
        mainView.addGestureRecognizer(gesture)
    }

    @objc func checkAction(sender : UITapGestureRecognizer) {
       yesOrNoWithDelay()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            yesOrNoWithDelay()
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
        }
    }
    
    func yesOrNo() -> String {
       let randomBool = Bool.random()
      if (randomBool){
         return "Yeah"
      } else {
         return "Nah"
      }
    }
    
    func yesOrNoWithDelay() {
        let seconds = 0.5
        activityIndicator.isHidden = false
        shakeLabel.isHidden = true
           activityIndicator.startAnimating()
           DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
               // Put your code which should be executed with a delay here
               self.activityIndicator.stopAnimating()
            self.shakeLabel.isHidden = false
                self.activityIndicator.isHidden = true
                let randomBool = Bool.random()
                    if (randomBool){
                        self.shakeLabel.text = "Yeah"
                    } else {
                        self.shakeLabel.text = "Nah"
                    }
           }
    }
}


