//
//  ViewController.swift
//  Login-Attempt-2
//
//  Created by Brandon Swett on 10/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    // This view controller will be handling the animation for the welcome image.
    private let imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.image = UIImage(named: "LogoRemovedWhiteSpace")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {self.animate()})
    }
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let Xdiff = size - self.view.frame.size.width
            let Ydiff = self.view.frame.size.height - size
            self.imageView.frame = CGRect(x: -(Xdiff/2), y: Ydiff/2, width: size, height: size)
        })
        UIView.animate(withDuration: 1.5, animations: {self.imageView.alpha = 0},completion: {done in
            if done{
                let viewController = HomeViewController()
                viewController.modalTransitionStyle = .crossDissolve
                self.present(viewController, animated: true)
                }
        })
    }
}
