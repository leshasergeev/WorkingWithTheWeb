import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL.init(string: "https://www.apple.com")!
let task = URLSession.shared.dataTask(with: url) { (data, respounce, error) in
    if let data = data {
        print(data)
        PlaygroundPage.current.finishExecution()
    }
}

task.resume()












