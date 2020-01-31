import UIKit

class UsersViewController: UIViewController {
    
    let mainView = UsersView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

