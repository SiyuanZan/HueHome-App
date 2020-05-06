//
//  StripAPIRequest.swift
//  HueHome
//
//  Created by Siyuan Zan on 4/24/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import Foundation
struct StripAPIRequest{
    let resourceURL:URL
    
    init(endpoint:String){
        
      let resourceString="http://192.168.1.17/api/ozgD67OO8dfId2s2aM0i43bCLDdirrVjBx4wD8DL/lights/5/\(endpoint)"
       
        guard let resourceURL=URL(string: resourceString)else{fatalError()}
        self.resourceURL=resourceURL
    }

    
    func save(_ messageToSave:StateStrip, completion:@escaping(Result<StateStrip,APIError>)->Void){
        
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
                "hue":1416
            ]

            let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dateTask=URLSession.shared.dataTask(with: urlRequest){data,response, _ in
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{ completion(.failure(.responseProblem))
                    
                    return
                }
                
                do{let messageData = try JSONDecoder().decode(StateStrip.self,from:jsonData)
                    
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


struct StripAPIRequestCt{
    let resourceURL:URL
    
    init(endpoint:String){
        
      let resourceString="http://192.168.1.17/api/ozgD67OO8dfId2s2aM0i43bCLDdirrVjBx4wD8DL/lights/6/\(endpoint)"
       
        guard let resourceURL=URL(string: resourceString)else{fatalError()}
        self.resourceURL=resourceURL
    }

    
    func save(_ messageToSave:StateStripCt, completion:@escaping(Result<StateStripCt,APIError>)->Void){
        
        do{
            var urlRequest=URLRequest(url:resourceURL)
            urlRequest.httpMethod="PUT"
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
            
            let jsonDictionary: [String: Int] = [
                "bri": 255
               
            ]

            let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dateTask=URLSession.shared.dataTask(with: urlRequest){data,response, _ in
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{ completion(.failure(.responseProblem))
                    
                    return
                }
                
                do{let messageData = try JSONDecoder().decode(StateStripCt.self,from:jsonData)
                    
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
