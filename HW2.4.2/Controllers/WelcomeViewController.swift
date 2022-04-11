import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel?
    
    @IBOutlet var imageView: UIImageView?
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel?.text = "Welcome, \(user?.person.fullname ?? "No name")!"
        imageView?.image = UIImage(named: "J♥")
    }
}
