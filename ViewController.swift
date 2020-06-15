//
//  ViewController.swift
//  IOSWeek9
//
//  Created by admin on 15/06/2020.
//  Copyright © 2020 Fred. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var savenotebutton: UIButton!
    @IBAction func saveNote(_ sender: UIButton) {
        saveNoteFunc()
    }
    
    @IBOutlet weak var notetextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        FirebaseApp.configure()
        
    }
    func saveNoteFunc(){
            var noteText = notetextfield.text
            let db = Firestore.firestore()

            
            //Creating a Document in the Database here instead of in the browser
            var ref: DocumentReference? = nil
            ref = db.collection("Notes").addDocument(data: [
                "Note": noteText
            ]){ err in
                if let err = err{
                    print("Error! Connet Add Data to Database: \(err)")
                }else {
                    print("Data added to Databse !: \(ref!.documentID)")
                    
                }
                
            }
            
        }
    }

