import UIKit

class InfoViewController: UIViewController {
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedTitle = user?.person.fullname {
            title = unwrappedTitle
        }
    }
}
