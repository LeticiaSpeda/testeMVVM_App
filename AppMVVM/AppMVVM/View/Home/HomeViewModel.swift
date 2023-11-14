import UIKit

final class HomeViewModel {
    private var service = HomeService()
    private var posts = [Posts]()
    private var story = [Stories]()

    var getListStory: [Stories] {
        story
    }

     var getPosts: [Posts] {
        posts
    }

    var numberOfItems: Int {
        2
    }

    func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }

    func fetchAllRequest() {
        service.getHomeDataJson { homeData, error in
            if error == nil {
                self.posts = homeData?.posts ?? []
                self.story = homeData?.stories ?? []
            }
        }
    }
}
