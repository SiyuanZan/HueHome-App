//
//  APIRequest.swift
//  HueHome
//
//  Created by Siyuan Zan on 4/21/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import Foundation
enum APIError:Error{
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest{
    let resourceURL:URL
    
    init(endpoint:String){
        
      let resourceString="http://192.168.1.17/api/ozgD67OO8dfId2s2aM0i43bCLDdirrVjBx4wD8DL/lights/7/\(endpoint)"
       
        guard let resourceURL=URL(string: resourceString)else{fatalError()}
        self.resourceURL=resourceURL
    }

    
    func save(_ messageToSave:Statelight, completion:@escaping(Result<Statelight,APIError>)->Void){
        
        do{
            var urlRequest=URLRequest(url:resourceURL)
            urlRequest.httpMethod="PUT"
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
            
            let jsonDictionary: [String: Int] = [
                "bri": 255,
            ]

            let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dateTask=URLSession.shared.dataTask(with: urlRequest){data,response, _ in
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{ completion(.failure(.responseProblem))
                    
                    return
                }
                
                do{let messageData = try JSONDecoder().decode(Statelight.self,from:jsonData)
                    
                    completion(.success(messageData))
                }catch{
                    completion(.failure(.decodingProblem))
                }
                
            }
            dateTask.resume()
        }catch{
            
            completion(.failure(.encodingProblem))
        }
        
        
    }
    
}
