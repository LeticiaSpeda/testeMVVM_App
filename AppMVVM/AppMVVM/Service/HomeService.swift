import UIKit

final class HomeService {

    func getHomeDataJson(completion: @escaping (HomeData?, Error?) -> Void) {

        if let url = Bundle.main.url(forResource: "Response.json", withExtension: nil) {
            do {
                let data = try Data(contentsOf: url)
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                
                completion(homeData, nil)
            } catch {
                completion (nil, error)
            }
        }
    }
}


