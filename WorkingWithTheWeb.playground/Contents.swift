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


var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
urlComponents.queryItems = [
    "api_key": "DEMO_KEY",
    "date": "2013-07-16"
    ].map {URLQueryItem(name: $0.key, value: $0.value)}
print(urlComponents)

let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, respounce, error) in
    if let data = data {
        let str = String(data: data, encoding: .utf8)
        print(str)
        PlaygroundPage.current.finishExecution()
    }
}
task.resume()












