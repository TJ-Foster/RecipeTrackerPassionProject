//
//  RecipeDetailViewController.swift
//  RecipeTrackerv2
//
//  Created by TJ Foster on 2020-03-23.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController
{
    var recipe: Recipe?
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recipe?.name
        
        ingredientsLabel.text = recipe?.ingredients
        instructionsLabel.text = recipe?.instructions
        // Do any additional setup after loading the view.
    }
}
