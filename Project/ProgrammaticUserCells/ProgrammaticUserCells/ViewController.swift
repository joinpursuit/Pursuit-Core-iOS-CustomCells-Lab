import UIKit

class ViewController: UIViewController {

    var users = [User]() {
        didSet {
            collectionOutlet.reloadData()
        }
    }
    
    lazy var collectionOutlet: UICollectionView = { [unowned self] in
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                  layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
                  layout.itemSize = CGSize(width: 60, height: 60)
        
        
        let collectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionOutlet)
        collectionOutlet.dataSource = self
        collectionOutlet.delegate = self
        loadData()
    }

    
    private func loadData() {
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let userData):
                    self.users = userData
                }
            }
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionOutlet.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.namelabel.text = users[indexPath.row].name.fullName
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        let user = users[indexPath.row]
        
        detailVC.user = user
        
        self.present(detailVC, animated: true )
    }
}


class CustomCell : UICollectionViewCell {
   
    lazy var namelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.frame = CGRect(x: 25, y: 15, width: 250, height: 20)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:.zero)
        contentView.addSubview(namelabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
   
}






