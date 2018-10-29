//
//  Bridge.swift
//  WKWebviewBridge
//
//  Created by lu sitong on 2018/10/27.
//  Copyright © 2018 lu sitong. All rights reserved.
//

import Foundation
import WebKit

public class Bridge: NSObject, WKScriptMessageHandler {
    public typealias Callback = (WKScriptMessage) -> Void
    
    var webView: WKWebView!
    var callback: Callback!
    
    public init(webView: WKWebView, callback: @escaping Callback) {
        super.init()
        self.webView = webView
        self.callback = callback
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        callback(message)
    }
    
    
    public func addHandler(_ name: String) {
        webView.configuration.userContentController.add(self, name: name)
    }
    
    public func removeHandler(_ name: String) {
        webView.configuration.userContentController.removeScriptMessageHandler(forName: name)
    }
}
