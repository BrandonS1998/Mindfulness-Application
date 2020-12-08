//
//  HomeViewController.swift
//  Login-Attempt-2
//
//  Created by Brandon Swett on 10/23/20.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //playBackgroundVideo()
        styleButton(logButton)
        styleButton(registerButton)
        
        // Styling the textFields to make them easier to read
        
        //logButton.layer.borderColor = UIColor.white.cgColor
        //registerButton.layer.borderColor = UIColor.white.cgColor
        
        //logButton.layer.borderWidth = 1.0
        
        //registerButton.layer.borderWidth = 1.0
    }
    
    func styleButton(_ button : UIButton){
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
