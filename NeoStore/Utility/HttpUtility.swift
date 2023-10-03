//
//  HttpUtility.swift
//  NeoStore
//
//  Created by apple on 14/08/23.
//

import Foundation
import Alamofire


class HttpUtility{

    private init(){
        
    }
   static func getUtility() -> HttpUtility{
        return HttpUtility()
    }
    
    func getApiData<T:Codable>(requestUrl: String,requestBody:Dictionary<String,Any>, resultType: T.Type, completionHandler:@escaping((_ result:T?) -> Void) ,headers:HTTPHeaders?=nil ) throws {
        AF.request(requestUrl,method:.get,parameters:requestBody, encoding:URLEncoding.default,headers: headers).response {
               response in
               switch response.result {
               case .failure(let error):
                   print(error)
               case .success(_):
                  
                   do {
                       let decoder = JSONDecoder()
                       //decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let result = try decoder.decode(T.self, from: response.data ?? Data() )
    
                       completionHandler(result)
                   } catch {
                       print(error)

                   }
               }
           }
       }
    func postApiData<T:Codable>(requestUrl: String,requestBody:Dictionary<String,Any>, resultType: T.Type, completionHandler:@escaping((_ result:T?) -> Void),headers:HTTPHeaders?=nil   ) throws {
                   AF.request(requestUrl,method:.post,parameters:requestBody, encoding:URLEncoding.default,headers: headers).response{
               response in
               switch response.result {
               case .failure(let error):
                   //completionHandler()
                   print(error)
               case .success(_):
                   do {
                       let decoder = JSONDecoder()
                       //decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let result = try decoder.decode(T.self, from: response.data ?? Data())
                       completionHandler(result)
                   } catch {
                       print(error)
                   }
               }
           }
       }
}
