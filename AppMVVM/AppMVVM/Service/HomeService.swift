import UIKit
import Alamofire

final class HomeService {

    func getHomeDataAlamofire(completion: @escaping (HomeData?, Error?) -> Void) {
        let url = "https://run.mocky.io/v3/4d35a699-c417-4ef7-bf88-645679a4c191"

        AF.request (url, method: .get).validate().responseDecodable(of: HomeData.self) { response in
            debugPrint (response)

            switch response.result {

            case .success (let success):
                completion(success, nil)

            case . failure(let error):
                completion (nil, error)
            }
        }
    }
}
