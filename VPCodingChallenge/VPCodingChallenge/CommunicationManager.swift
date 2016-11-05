//
//  CommunicationManager.swift
//  GoGreen
//
//  Created by Krishna Kumar on 4/12/16.
//  Copyright © 2016 Infogain. All rights reserved.
//

// This class is reponsilble for all the communication Requests.
// There will another monthods
// 1. Upload Task
// 2. Download Task
// 3. Data Task

// =================================================================================================
// Imports
// =================================================================================================

import Foundation

class CommunicationManager {
    static let sharedInstance = CommunicationManager()
    fileprivate init() {
    }
    
    /**
     * Send a request to the server encoded as JSON.
     *
     * @param passedOperation RemoteOperation.
     * @param completionBlock Block to execute so response or error can be handled.
     */
    func addRemoteOperation(_ request:(URLRequest), completionBlock:@escaping parseDataCompletionHandlerBlock
        ) -> Void {
        let session = URLSession.shared
        let task: URLSessionTask?
        let request: URLRequest = request
        task = session.dataTask(with: request, completionHandler: { responseData, response, error -> Void in
        if responseData != nil {
            completionBlock(responseData,nil)
        }
        else {
            completionBlock(nil,error as NSError?)
        }
        })
        task?.resume();
    }
}
