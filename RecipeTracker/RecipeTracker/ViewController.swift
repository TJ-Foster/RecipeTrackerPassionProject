//
//  ViewController.swift
//  RecipeTracker
//
//  Created by TJ Foster on 2020-02-25.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      var ref: DatabaseReference!
      ref = Database.database().reference()
      ref.setValue("Test")
    }


}

