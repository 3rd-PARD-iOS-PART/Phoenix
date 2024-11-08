import UIKit
import CHTCollectionViewWaterfallLayout


class repoViewController : UIViewController {
    

    let headView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        
        
        label.text = "당신의 소중한 청춘들을 저장해 두었어요 :)"
        label.textColor = #colorLiteral(red: 0.5593468547, green: 0.5593467951, blue: 0.5593468547, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 11 ,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25 ,weight: .bold)
        label.text = "청춘 저장소"
        label.textColor = #colorLiteral(red: 0.1775263846, green: 0.5874372125, blue: 0.2503151298, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let bodyView : UICollectionView = {
//        let flowlayout = UICollectionViewFlowLayout()
        
        
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .shortestFirst
        layout.columnCount = 2
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let view = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    // MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        bodyView.dataSource = self
        bodyView.delegate = self
        bodyView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        setUI()
    }
    
    
    func setUI(){
        view.addSubview(headView)
        headView.addSubview(headLabel)
        headView.addSubview(titleLabel)
        view.addSubview(bodyView)
        
        
        
        NSLayoutConstraint.activate([
            headView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headView.heightAnchor.constraint(equalToConstant: 81),
                        
            headLabel.topAnchor.constraint(equalTo: headView.safeAreaLayoutGuide.topAnchor , constant: 13),
            headLabel.leadingAnchor.constraint(equalTo: headView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: headView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
        
            bodyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 16),
            bodyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -16),
            bodyView.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 16),
            bodyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ),
        
        ])
        
        
        
    }
}

extension repoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RepoModel.ModelData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bodyView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else{
            print("error using collectioview")
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white

        let target = RepoModel.ModelData[indexPath.item]
        let image = UIImage(named: "\(target.image).jpeg")
        cell.imageView.image = image
      
        return cell
    }
}




//extension repoViewController : UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // 각 아이템의 크기를 반환
//        return CGSize(width: 150, height: 200)
//    }
//
//    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    //        let screenWidth = collectionView.bounds.width
//    //        var itemWidth = (screenWidth - 10) / 2 // 두 개의 열로 나누기
//    //
//    //        let target = RepoModel.ModelData[indexPath.item]
//    //        if let image = UIImage(named: "\(target.image).jpeg") {
//    //            let aspectRatio = image.size.height / image.size.width
//    //            let itemHeight = itemWidth * aspectRatio
//    ////            itemWidth = itemHeight * aspectRatio
//    //            print(itemWidth)
//    //            print(itemHeight)
//    //            print("✅")
//    //            return CGSize(width: itemWidth, height: itemHeight)
//    //        } else {
//    //            return CGSize(width: itemWidth, height: itemWidth) // 기본 정사각형 크기
//    //        }
////}
//
//
//
//
//
//}


extension repoViewController: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let target = RepoModel.ModelData[indexPath.item]
        if let image = UIImage(named: "\(target.image).jpeg") {
            let width = collectionView.bounds.width / 2 - 20 // 2열로 표시하고 여백 고려
            let aspectRatio = image.size.height / image.size.width
            let height = width * aspectRatio
            return CGSize(width: width, height: height)
        }
        return CGSize(width: 150, height: 200) // 기본 크기
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
            return 2 // 2열로 설정
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingFor section: Int) -> CGFloat {
            return 16
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumColumnSpacingFor section: Int) -> CGFloat {
            return 16
        }
}
