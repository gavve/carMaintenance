//
//  connectie.swift
//  JsonBackend
//
//  Created by vmware on 28/11/15.
//  Copyright © 2015 vmware. All rights reserved.
//

import Foundation

/*!
*    @class Connectie
*
*    @brief This class handles the basic API connection with the server.
*
*    @discussion The Connectie class establishes the JSON API connection with the server (only GET requests).
*
*
*/

class Connectie
{
    
    var responseFinal = ""
    
    /*!
    *   @brief Posts the requests and eventually returns the response
    *   @param url Link of where the request has to be send to.
    *   @return (eventually) returns a NSString with the response.
    *   @warning The response could also be "error"!
    */
    func post(url : String, completion: ((result:NSString?) -> Void)!)
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            {
                data, response, error in
                
                if error != nil
                {
                    print("error=\(error)")
                    completion(result: "error")
                    return
                }
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                completion(result: responseString)
                
                
        }
        task.resume()
        
        
    }
    
    
    
}