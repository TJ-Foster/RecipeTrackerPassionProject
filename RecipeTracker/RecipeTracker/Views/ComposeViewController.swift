//
//  ComposeViewController.swift
//  RecipeTracker
//
//  Created by TJ Foster on 2020-03-12.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class ComposeViewController: UIViewController {

    var ref :DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitRecipe(_ sender: Any) {
        
        // Post the Recipe Name to firebase
        ref?.child("Users").childByAutoId().child("Test").child("Ingredients").childByAutoId().setValue("")
        
        // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelRecipe(_ sender: Any) {
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
