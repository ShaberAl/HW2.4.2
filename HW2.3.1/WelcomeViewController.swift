import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel?
    
    @IBOutlet var imageView: UIImageView?
    
    var nameOfUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel?.text = nameOfUser
        imageView?.image = UIImage(named: "J♥")
    }
}
