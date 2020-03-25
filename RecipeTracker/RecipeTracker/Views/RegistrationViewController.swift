import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
     if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
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
  

  
