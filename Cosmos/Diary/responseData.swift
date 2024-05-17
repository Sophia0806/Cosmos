//
//  responseData.swift
//  Cosmos
//
//  Created by 😏 😏 on 28/3/2023.
//

import Foundation
import SwiftUI


struct Result : Codable{
    var probability: Probability
    var label: String
    struct Probability: Codable{
        var neg: Double
        var neutral: Double
        var pos: Double
    }
}

/*
{
  "label": "
 pos",
  "probability": {
    "neg": 0.39680317,
    "neutral": 0.28207585,
    "pos": 0.60319686
  }
}
*/
class ResponseData: ObservableObject{
    func API(content: String)-> Int{
        var dataReceived: Data?
        var output = 0
        let sem = DispatchSemaphore.init(value: 0)
        //print(content)
        guard let url = URL(string: "http://text-processing.com/api/sentiment/") else { fatalError("Missing URL") }
        var request = URLRequest(url: url)
        request.httpBody = Data("text=\(content)".utf8)
        request.httpMethod = "POST"

        var session = URLSession.shared
        var dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in defer {sem.signal()}
            if (error != nil) {
                print(error)
                return
            }
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                dataReceived = data
        })
        
        dataTask.resume()
        sem.wait()
        
        guard let data = dataReceived else { return 0 }
        
        do {
            let decodedResult = try JSONDecoder().decode(Result.self, from: data)
            let result: Result = decodedResult
            //print(result)
            if(result.label=="pos"){
                output = 1
            }
            else if(result.label=="neg"){
                output = -1
            }
                } catch let error {
                    print("Error decoding: ", error)
            }
        return output
    }
}
