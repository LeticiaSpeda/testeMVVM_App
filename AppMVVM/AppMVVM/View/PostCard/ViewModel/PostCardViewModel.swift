import UIKit

final class PostCardViewModel {
    private var listPosts: [Posts]

    init(listPosts: [Posts]) {
        self.listPosts = listPosts
    }

    var numberOffItens: Int {
        listPosts.count
    }

    func loadCurrentPost(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}
