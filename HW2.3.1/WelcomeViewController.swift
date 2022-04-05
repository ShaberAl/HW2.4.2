import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel?
    
    var nameOfUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel?.text = nameOfUser
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}
