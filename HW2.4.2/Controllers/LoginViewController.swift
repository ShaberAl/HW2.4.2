import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    
    private let user = User.getUserInfo()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let infoVC = navigationVC.topViewController as? InfoViewController else { return }
                infoVC.user = user
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        userPasswordTF.text?.removeAll()
    }
    
    @IBAction func logButton() {
        guard userNameTF.text == user.login else { showAlert(); return }
        guard userPasswordTF.text == user.password else { showAlert(); userPasswordTF.text?.removeAll(); return }
    }
    
    @IBAction func showInfoButton(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(message: "Your login is \(user.login)") : showAlert(message: "Your password is \(user.password)")
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
