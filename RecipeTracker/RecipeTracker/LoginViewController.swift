import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
     if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                  if let err = error {
                    // there was an error, print it
                    print(err)
                  } else {
                    // successfully created user
                    print("successfully created user " + email)
                  }
                }
         }
    }
}
    
    
    
