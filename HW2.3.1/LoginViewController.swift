import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    
    private let userName = "Homework"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userLogin = segue.destination as? WelcomeViewController else { return }
        
        userLogin.nameOfUser = "Welcome, \(userName)!"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let exit = segue.source as? WelcomeViewController else { return }
        
        userNameTF.text?.removeAll()
        userPasswordTF.text?.removeAll()
        
        exit.dismiss(animated: true)
    }
    
    @IBAction func logButton() {
        guard userNameTF.text == userName else { showAlert(); return }
        guard userPasswordTF.text == password else { showAlert(); userPasswordTF.text?.removeAll(); return }
    }
    
    @IBAction func showNameButton() {
        showAlert(message: "Your login is \(userName)")
    }
    
    @IBAction func showPasswordButton() {
        showAlert(message: "Your password is \(password)")
    }
}

//MARK: Notification method & keyboard
extension LoginViewController {
    private func showAlert(title: String = "Information", message: String = "Incorrect login or password. Try again") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(oKAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}
