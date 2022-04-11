import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    
    private let userName = "Homework"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userLogin = segue.destination as? WelcomeViewController else { return }
        
        userLogin.nameOfUser = userName
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        userPasswordTF.text?.removeAll()
    }
    
    @IBAction func logButton() {
        guard userNameTF.text == userName else { showAlert(); return }
        guard userPasswordTF.text == password else { showAlert(); userPasswordTF.text?.removeAll(); return }
    }
    
    @IBAction func showInfoButton(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(message: "Your login is \(userName)") : showAlert(message: "Your password is \(password)")
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
