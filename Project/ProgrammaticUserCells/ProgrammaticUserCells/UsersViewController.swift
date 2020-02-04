import UIKit

class UsersViewController: UIViewController {
    
    let mainView = UsersView()
    
    private var users = [User](){
        didSet{
            self.mainView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.collectionView.register(UsersCell.self, forCellWithReuseIdentifier: "UserCell")
        loadUsers()
        dataSourcesAndDelegates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func loadUsers(){
        UsersFetchingService.manager.getUsers { [weak self](result) in
            switch result{
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Network Error", message: "\(appError)")
                }
            case .success(let users):
                    self?.users = users
            }
        }
    }
    
    func dataSourcesAndDelegates(){
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }

}

extension UsersViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UsersCell else {
            fatalError("failed to downcast to UsersCell")
        }
        
        let user = users[indexPath.row]
        cell.configureCell(for: user)
        return cell
    }
}

extension UsersViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing:CGFloat = 10 //space between items
        let maxWidth = UIScreen.main.bounds.size.width // device's width
        let numberOfItems: CGFloat = 3// items
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let user = users[indexPath.row]
        detailVC.passedUserObj = user
        navigationController?.pushViewController(detailVC, animated: true)
        

    }
}
