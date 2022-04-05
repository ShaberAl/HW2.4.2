import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel?
    
    @IBOutlet var imageView: UIImageView?
    
    var nameOfUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel?.text = "Welcome, \(nameOfUser)!"
        imageView?.image = UIImage(named: "J♥")
    }
}
