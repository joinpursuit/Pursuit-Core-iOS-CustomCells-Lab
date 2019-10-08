import UIKit

class ViewController: UIViewController {

    var users = [User]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
     lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 300)
        
        let userCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        userCollectionView.dataSource = self
        userCollectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "userCell")
        userCollectionView.showsVerticalScrollIndicator = false
        userCollectionView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            
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
        
        cell.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        return cell
    }
}


