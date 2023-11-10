import UIKit

final class StoryCardViewModel {
    private var listStory: [Stories]
    
    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    var numberOfItens: Int {
        listStory.count
    }
    
    func loadCurrentStory(index: IndexPath) -> Stories {
        listStory[index.row]
    }
}
