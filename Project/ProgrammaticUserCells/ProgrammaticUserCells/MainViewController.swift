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
        view.backgroundColor = .systemGreen
        navigationItem.title = "Random Users"
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.collectionView.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "usersCell")
        
        //FIXME:
        //fetchUsers()
       // loadData()
        
    }
    
//    func loadData() {
//        users = User.getUsers()
//    }
    
    //FIXME:
    //    private func fetchUsers() {
    //UsersFetchingService.getUsers() { (result) in
    //            switch result {
    //            case .failure(let appError):
    //                print("error fetching users \(appError)")
    //            case .success(let users):
    //                self.users = users
    //            }
    //
    //        }
    //    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //FIXME: users.count
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCell", for: indexPath) as?
            UsersCell else {
                fatalError("could not downcast to UsersCell")
        }
        //FIXME?
        cell.backgroundColor = .red
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
       // let user = users[indexPath.row]
        //FIXME: SEGUE to detail VC:
        let detailVC = DetailViewController()
        detailVC.user = users
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
