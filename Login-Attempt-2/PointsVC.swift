//
//  ViewController.swift
//  Points
//
//  Created by Ryan on 11/3/20.
//

import UIKit
import Firebase
import FirebaseCore

class PointsVC: UIViewController {
    
    var quotes: [String] = ["Just Breathe WORKING",
                            "Be Present",
                            "Sit in Stillness",
                            "Peaceful Presence"]
    
    //Outlets
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
    // Circle shape
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    // Level label
    var levelLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    // flags
    let colorChoice = UIColor.blue.cgColor
    let expPerLevel = 100
    
    let user = Auth.auth().currentUser
    var exp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Random int generation
        let randInt = Int.random(in: 0..<quotes.count)
        quoteLabel.text = quotes[randInt]
        
        // Load exp from firebase
        let db = Firestore.firestore()
        db.collection("UserPoints").document(self.user!.uid).getDocument { (document, error) in
            if error == nil {
                if (document != nil && document!.exists) {
                    let points = document!.get("Points")
                    if let p = points as! Int? {
                        print("reading \(p) points from user id= \(self.user!.uid)")
                        self.exp = p
                        
                        // Update label
                        print("Update score label with \(self.exp)")
                        self.scoreText.text! = String(self.exp % self.expPerLevel)
                        
                        // Update level label
                        print("Update level label with \(self.exp/self.expPerLevel)")
                        self.levelLabel.text! = "Level " + String(self.exp/self.expPerLevel)
                        
                        // Update progress bar
                        self.updateProgress()
                    } else {
                        print("error loading points data from firebase")
                    }
                }
            }
        }
        
        // Define path of progress bar
        let circPath = UIBezierPath(arcCenter: view.center, radius: 100,
                                    startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // Draw track bar
        trackLayer.path = circPath.cgPath
        trackLayer.strokeColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
        
        // Draw circle
        shapeLayer.path = circPath.cgPath
        shapeLayer.strokeColor = colorChoice
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.lightGray.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        // Draw lvl label
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        let label = self.levelLabel
//        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 300).isActive = true
        label.center = view.center
        label.textAlignment = .center
        label.text = "Level \(exp/expPerLevel)"
        label.textColor = UIColor.init(cgColor: UIColor.white.cgColor)
        label.font = UIFont.boldSystemFont(ofSize: 35)
        self.view.addSubview(label)
        
        updateProgress()
    }
    
    // Helper function to update progress during view init
    func updateProgress() {
        
        // Calculate percent progress to next level
        let expToNextLevel : Float = Float(exp % expPerLevel)
        let progressRatio : Float = expToNextLevel / Float(expPerLevel)
        
        // Animate progress
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = progressRatio - 0.1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "Default")
    }
    
    @IBAction func scoreIncreased(_ sender: Any) {
        
        // level up local exp and firebase Points
        self.exp += 1
        
        let db = Firestore.firestore()
        db.collection("UserPoints").document(self.user!.uid).setData(["Points": self.exp],merge: true)
        print("saved \(self.exp) to user id= \(self.user!.uid)")
        
        viewDidLoad()
        
    }
    
    func instructPlayIncreased() {
        let db = Firestore.firestore()
        db.collection("UserPoints").document(self.user!.uid).getDocument { (document, error) in
            if error == nil {
                if (document != nil && document!.exists) {
                    let points = document!.get("Points")
                    if let p = points as! Int? {
                        print("reading \(p) from user id= \(self.user!.uid)")
                        self.exp = p
                    } else {
                        print("error loading points data from firebase")
                    }
                }
            }
        }
        
        // level up local exp and firebase Points
        self.exp += 100
        
        db.collection("UserPoints").document(self.user!.uid).setData(["Points": self.exp],merge: true)
        print("saved \(self.exp) to user id= \(self.user!.uid)")
        
        
    }
    
    
    func medPlayIncreased() {
        let db = Firestore.firestore()
        db.collection("UserPoints").document(self.user!.uid).getDocument { (document, error) in
            if error == nil {
                if (document != nil && document!.exists) {
                    let points = document!.get("Points")
                    if let p = points as! Int? {
                        print("reading \(p) from user id= \(self.user!.uid)")
                        self.exp = p
                    } else {
                        print("error loading points data from firebase")
                    }
                }
            }
        }
                        
        // level up local exp and firebase Points
        self.exp += 50
        
        db.collection("UserPoints").document(self.user!.uid).setData(["Points": self.exp],merge: true)
        print("saved \(self.exp) to user id= \(self.user!.uid)")
    }
}

