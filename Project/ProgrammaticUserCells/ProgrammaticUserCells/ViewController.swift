import UIKit

class ViewController: UIViewController {

    var users = [User]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
     lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 325, height: 300)
        
        let userCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        userCollectionView.dataSource = self
        userCollectionView.delegate = self
        userCollectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "userCell")
        userCollectionView.showsVerticalScrollIndicator = false
        userCollectionView.backgroundColor = #colorLiteral(red: 0.3850156015, green: 0.8531414642, blue: 0.985880573, alpha: 0.6418999566)
            
        return userCollectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        loadData()
    }
    
    private func loadData() {
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let usersFromJSON):
                    self.users = usersFromJSON
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCollectionViewCell else {return UICollectionViewCell()}
        
        let user = users[indexPath.row]
        
        cell.nameLabel.text = user.name.first
        
        ImageHelper.shared.getImage(urlStr: user.picture.large) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    cell.userImage.image = imageFromOnline
                }
            }
        }
        
        cell.backgroundColor = #colorLiteral(red: 0.5485045887, green: 0.8194161367, blue: 0.8383918695, alpha: 1)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentUser = users[indexPath.row]
        let detailVC  = DetailViewController()
        detailVC.view.backgroundColor = #colorLiteral(red: 0.5485045887, green: 0.8194161367, blue: 0.8383918695, alpha: 1)
        detailVC.user = currentUser
        self.present(detailVC, animated: true, completion: nil)
    }
}


