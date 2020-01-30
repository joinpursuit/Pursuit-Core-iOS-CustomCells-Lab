import UIKit

class ViewController: UIViewController {
    
    private let userView = UserView()
    
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.userView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Users"
        userView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
       // userView.collectionView.delegate = self
        userView.collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast to UserCell")
        }
        cell.backgroundColor = .white
        return cell
    }
}
