//
//  RecipesViewController.swift
//  RecipeTrackerv2
//
//  Created by TJ Foster on 2020-03-14.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var recipes: [Recipe] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ref = Database.database().reference()

        guard let userID = Auth.auth().currentUser?.uid else { return }
//
//        databaseHandle = ref?.child(userID).observe(.childAdded, with: { (snapshot) in
//
////            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//            let post = snapshot.value as? String
//            if let actualPost = post {
//                self.recipes.append(actualPost)
//
//                self.tableView.reloadData()
//            }
//        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        
//        cell.textLabel?.text = recipes[indexPath.row]
        
        let recipe = recipes[indexPath.row]
        
//        cell = recipe.name
    
        
        
        
        return cell
    }
    
    func getRecipes() {
        // get all users and recipes
        let recipesDB = Database.database().reference().child("users")
        
        // observe for changes in firebase users db
        recipesDB.observe(.childAdded) { ( snapShot ) in
            // Originally data was stored as a dictionary so need to cast the value we're getting from firebase into a dictionary
        if let value = snapShot.value as? Dictionary<String, String>,
            let name = value["Recipe Name"],
            let ingredients = value["Ingredients"],
            let instructions = value["Instructions"]{
            // create a Recipe object from the data received from firebase
            let recipe = Recipe(name: name, ingredients: ingredients, instructions: instructions)
            // add the new recipes to our recipes array
            self.recipes.append(recipe)
            //reload the table
            self.tableView.reloadData()
            }
        }
    }
}
