import UIKit
import Alamofire

final class HomeService {

    enum ErrorDetail: Swift.Error {
        case errorUrl(urlString: String)
        case detailError(detail: String)
    }

    func getHomeData(completion: @escaping (HomeData?, Error?) -> Void) {
        let url = "https://run.mocky.io/v3/4d35a699-c417-4ef7-bf88-645679a4c191"
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data else { return completion(nil, ErrorDetail.errorUrl(urlString: url))}

            guard let response = response as? HTTPURLResponse else { return completion(nil, ErrorDetail.detailError(detail: "")) }

            let json = try? JSONSerialization.jsonObject(with: data, options: [])

            if response.statusCode == 200 {
                do {
                    let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                    print("SUCCESS ~> \(#function)")
                    completion(homeData, nil)
                } catch {
                    print ("ERROR →>\(#function)")
                    completion(nil, error)
                }

            } else {
                print ("ERROR →>\(#function)")
                completion(nil, error)
            }

        }
        .resume()
    }
}
//    func getHomeDataAlamofire(completion: @escaping (HomeData?, Error?) -> Void) {
//        let url = "https://run.mocky.io/v3/4d35a699-c417-4ef7-bf88-645679a4c191"
//
//        AF.request (url, method: .get).validate().responseDecodable(of: HomeData.self) { response in
//            debugPrint (response)
//
//            switch response.result {
//
//            case .success (let success):
//                completion(success, nil)
//
//            case . failure(let error):
//                completion (nil, error)
//            }
//        }
//    }


