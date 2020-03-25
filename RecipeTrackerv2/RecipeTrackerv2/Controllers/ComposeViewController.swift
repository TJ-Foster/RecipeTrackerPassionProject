//
//  ComposeViewController.swift
//  RecipeTrackerv2
//
//  Created by TJ Foster on 2020-03-14.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var recipeTextField: UITextField!
    
    @IBOutlet weak var instructionsTextView: UITextView!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        instructionsTextView.isHidden = true
        

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
    }
    
    @IBAction func saveRecipe(_ sender: Any) {
        // TODO: Post the data to the database
        if let recipeName = recipeTextField?.text {
            
            guard let userID = Auth.auth().currentUser?.uid else { return }
             ref?.child("users").child(userID).child(recipeName).child("Ingredients").setValue(ingredientsTextView.text)
            ref?.child("users").child(userID).child(recipeName).child("Instructions").setValue(instructionsTextView.text)
            
            ref?.child("users").child(userID).child(recipeName).child("Recipe Name").setValue(recipeName)
            
            self.performSegue(withIdentifier: "returnRecipes", sender: self)
        }
        
        
    }
    
    @IBAction func ingredientsToggle(_ sender: Any) {
        if instructionsTextView.isHidden == true {
            instructionsTextView.isHidden = false
            ingredientsTextView.isHidden = true
        }
        else {
            instructionsTextView.isHidden = true
            ingredientsTextView.isHidden = false
        }
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
