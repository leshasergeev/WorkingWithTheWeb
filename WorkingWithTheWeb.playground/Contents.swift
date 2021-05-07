import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let url = URL.init(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//let task = URLSession.shared.dataTask(with: url) { (data, respounce, error) in
//    if let data = data {
//        let str = String(data: data, encoding: .utf8)
//        print(str)
//        PlaygroundPage.current.finishExecution()
//    }
//}
//
//task.resume()


struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description    = "explanation"
        case url
        case copyright
    }
}


func fetchPhoto(completion: @escaping (Result<PhotoInfo,Error>) -> Void) {
    
    var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    urlComponents.queryItems = [
        "api_key":  "DEMO_KEY",
        "date":     "2013-07-16"
        ].map {URLQueryItem(name: $0.key, value: $0.value)}
    print(urlComponents)
    
    
    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, respounce, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
                completion(.success(photoInfo))
            } catch {
                completion(.failure(error))
            }
        }
    }
    task.resume()
}

fetchPhoto { (result) in
    
    switch result {
    case .failure(let error):
        print("Fetch Photo Failed with Error: \(error)")
    case .success(let photoInfo):
        print("Successfully fetched PhotoInfo: \(photoInfo)")
    }
    
    PlaygroundPage.current.finishExecution()
}













