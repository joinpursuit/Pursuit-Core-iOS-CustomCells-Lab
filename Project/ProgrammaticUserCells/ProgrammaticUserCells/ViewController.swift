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
    
    private var user: User?
    
    override func loadView() {
        view = userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Users"
        userView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
        userView.collectionView.delegate = self
        userView.collectionView.dataSource = self
        fetchUsers()
    }
    
    private func fetchUsers(){
        UsersFetchingService.manager.getUsers { (result) in
            switch result {
            case .failure(let appError):
                print("error fetching users \(appError)")
            case .success(let users):
                self.users = users
            }
    }
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count //users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast to UserCell")
        }
        //cell.backgroundColor = .white
        let user = users[indexPath.row]
        cell.configureCell(user: user)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
         let detailVC = DetailViewController()
        detailVC.user = user
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
