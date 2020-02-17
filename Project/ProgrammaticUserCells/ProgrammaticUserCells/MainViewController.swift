import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Random Users"
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.collectionView.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "usersCell")
        
        fetchUsers()
        
    }
    
    private func fetchUsers() {
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

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCell", for: indexPath) as?
            UsersCell else {
                fatalError("could not downcast to UsersCell")
        }
        let user = users[indexPath.row]
        cell.backgroundColor = .red
        cell.configureCell(for: user)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.95
        return CGSize(width: itemWidth, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        //FIXME: SEGUE to detail VC:
        let detailVC = DetailViewController()
        detailVC.user = user
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
