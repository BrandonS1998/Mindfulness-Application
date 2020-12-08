//
//  UserHomeViewController.swift
//  Login-Attempt-2
//
//  Created by Matthew Bierach on 11/15/20.
//

import UIKit
import AVFoundation
import AVKit

let storyboard: UIStoryboard = UIStoryboard.init(name: "Main",bundle: nil);
 
let pointsVC:
    PointsVC = storyboard.instantiateViewController(withIdentifier: "PointsVC") as! PointsVC;

class UserHomeViewController: UIViewController{
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionButton: UIButton!
    @IBOutlet weak var min20Button: UIButton!
    @IBOutlet weak var min5Button: UIButton!
    @IBOutlet weak var menuToolbar: UIToolbar!
    
    
    func styleButton(_ button : UIButton){
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(instructionButton)
        styleButton(min20Button)
        styleButton(min5Button)
    }
    
  
    @IBAction func instrutionButtonPressed(_ sender: Any) {
        
        // If mp4 files not in project, change to m4a or download files from zip
        let sound = Bundle.main.path(forResource: "Instructions", ofType: "mp4")

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: URL(fileURLWithPath: sound!))

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
                
        pointsVC.instructPlayIncreased()
    }
    
    @IBAction func dailyAudioPlayPressed(_ sender: Any) {
        
        // If mp4 files not in project, change to m4a or download files from zip
        let sound = Bundle.main.path(forResource: "20Minutes", ofType: "mp4")

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: URL(fileURLWithPath: sound!))

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
        pointsVC.medPlayIncreased()
    }
    
    
    @IBAction func preMRIAudioPressed(_ sender: Any) {
        
        // If mp4 files not in project, change ofType: to m4a or download files from zip
        let preMRIVid = Bundle.main.path(forResource: "PreMRI", ofType: "mp4")

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: URL(fileURLWithPath: preMRIVid!))

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
        pointsVC.instructPlayIncreased()
    }
    
    
    
}
