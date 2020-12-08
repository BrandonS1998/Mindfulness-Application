//
//  SurveyVeiwController.swift
//  Login-Attempt-2
//
//  Merged by Matthew Bierach on 11/17/20.
//  Created by Frank jing on 2020/11/3.
//

import UIKit
import Firebase
import FirebaseCore

class SurveyViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var survetT: UILabel!
    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var answerTextField: UITextField!
    
    let user = Auth.auth().currentUser
    
    func styleButton(_ button : UIButton){
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(nextButton)
    }
    
    @IBAction func nextSubmit(_ sender: UIButton) {
        let questionss = ["Helping you be consistent listening to the recording  (1 is poor and 5 is excellent)",
                          "Ease of loading the application on your phone (1 is poor and 5 is excellent)",
                          "Displaying your available recording (s) (1 is poor and 5 is excellent)",
                          "Look and feel of the application (1 is poor and 5 is excellent)",
                          "Managing any anxiety related to your MRI study (1 is poor and 5 is excellent)",
                          "Feeling a sense of control over your experience? (1 is poor and 5 is excellent)",
                          "What is the likelihood that you would use this application if it was as a standard of care offered to all patients having an  MRI or other medical procedures? (1 is poor and 5 is excellent)",
                          "Over-all effectiveness versus an in-person session (1 is poor and 5 is excellent)",
                          "Comments: If you would like to add further comments, please do so here.",
                          "*Anxiety scale: please rank your current level of anxiety or distress:(0-10)",
                          "What is your gender?",
                          "What is your age?",
                          "Which of the following best represents your racial or ethnic heritage?",
                          "What is the highest degree or level of school you have completed? If currently enrolled, highest degree received.",
                          "Which category best describes your annual income?",
                          "Which of the following best describes the area you live in?",
                          "In general, compared to other people your age, would you say that your health is:",
                          "How often did you see a doctor last year?",
                          "Do you have a usual source of care - a doctor you usually see for care?",
                          "Do you have a usual source of diagnostic services?",
                          "Do you have a chronic illness that requires regular care from a doctor, such as diabetes, high blood pressure, or asthma?",
                          "Do you have health insurance?"]
        let inquestions = ["If you listened to this recording prior to your MRI visit, was the application helpful to set a consistent time to practice and did the reminders effective in following through with the practice?",
                           "(Did you have any technical issues in uploading or launching the application)",
                           "(Was it clear how to get to the recording you needed to listen to, any technical issues)",
                           "(Was it appealing to you when you opened the application, the colors and the pictures pleasing to you?)",
                           "(Did you feel calmer going into your MRI study? )",
                           "(Did it personalize your experience? Did you feel more empowered about your experience? Did you feel like you had a tool to use while in the MRI scanner to stay relaxed and calm?)",
                           "(Should all patients have access to this type of application? Would you use this if you were having surgery, a biopsy, other edical procedures ?)",
                           "(Did the technology make this feel less personal or impactful to you?)",
                           "",
                           "(0 is mild, 10 is severe)",
                           "(A. male   B.female C.Non-binary D.Prefer not to answer)",
                           "",
                           "(A. Caucasian  B.African-American C.Asian-American   D.Hispanic  E.Native American / Alaskan Native / Pacific Islander  F. other  G.Prefer not to answer)",
                           "(A. Less than High School  B.High school graduate, diploma or the equivalent   C.Some college credit, no degree     D.Associate degree: occupational, tech, vocational    E.Associate degree: academic program    F. Bachelor's degree (BA, AB, BS, BBA)    G.Master's degree, Professional, Doctoral degree   H. Other / Prefer not to answer  )",
                           "(A. $1000-$5000    B.$5,001 - $10,000     C.$10,001 - $15,000   D.$15,001-$25,000    E.$25,001-$50,000    F. $50,001-$100,000    G.$100,001 or more   H. Prefer not to answer  )",
                           "(A.Urban     B.Suburban   C.Rural)",
                           "(A.Excellent   B.Very Good   C.Good  D.Fair   E.Poor)",
                           "(A.Never (0 times)     B.Sometimes (1 or 2  times)     C.Frequently (more than 2 times))",
                           "Yes/No",
                           "Yes/No",
                           "Yes/No",
                           "Yes/No"]
        
        let db = Firestore.firestore()
        
        let numLabelText:String = numberLabel.text! as String
        var numLabelInt = Int(numLabelText) ?? 0;
        numLabelInt += 1
        let index = numLabelInt - 1;
        let finalCount = questionss.count + 1
        
        if(numLabelInt <= questionss.count){
            numberLabel.text = "\(numLabelInt)";
            survetT.text = inquestions[index];
            questions.text = questionss[index];
            
            let userAnswer = String(answerTextField.text ?? "")
            
            db.collection("UserSurvey").document(self.user!.uid).setData(["\(numLabelInt-1)": userAnswer],merge: true)
        }
        
        if(numLabelInt == finalCount){
            nextButton.setTitle("Submit", for: .normal);
            numberLabel.text = ""
            questions.text = "You have finished the survey."
            survetT.text = "Press home to go back"
            answerTextField.text = ""
        }
    }
    
}
