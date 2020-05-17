//
//  Moya+Plugin.swift
//  uso
//
//  Created by sooyong on 2020/05/17.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 20 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 20 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

let activiyPlugIn = NetworkActivityPlugin { changeType, _ in
    let indicatorView = IndicatorView.shared
    switch changeType {
    case .began:
        indicatorView.addIndicatorView()
    case .ended:
        indicatorView.removeIndicatorView()
    }
}

class CompleteUrlLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print(debug: request.request?.url?.absoluteString ?? "Something is wrong")
    }
}

