

import Foundation


struct RepoModel{
    var title : String
    var image : String
}

#if DEBUG

extension RepoModel{
    
    static var ModelData = [
        RepoModel(title: "PARD", image: "img1"),
        RepoModel(title: "iOS", image: "img2"),
        RepoModel(title: "iOS", image: "img3"),
        RepoModel(title: "PARD", image: "img4"),
        RepoModel(title: "iOS", image: "img5"),
        RepoModel(title: "iOS", image: "img2"),
        RepoModel(title: "PARD", image: "pard"),
        RepoModel(title: "iOS", image: "img3"),
        RepoModel(title: "iOS", image: "apple"),
        RepoModel(title: "PARD", image: "pard"),
        RepoModel(title: "bear", image: "bear"),
        RepoModel(title: "iOS", image: "img3"),
        RepoModel(title: "iOS", image: "apple"),
        RepoModel(title: "iOS", image: "img1"),
        RepoModel(title: "iOS", image: "img5"),
        RepoModel(title: "iOS", image: "img4"),
        RepoModel(title: "iOS", image: "apple"),
        //이 부분 고쳐줘야 합니다!!
        RepoModel(title: "bear", image: "bear"),
        RepoModel(title: "flower", image: "flower"),
    ]
}
#endif
