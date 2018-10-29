//
//  ViewController.swift
//  WKWebviewBridgeDemo
//
//  Created by lu sitong on 2018/10/29.
//  Copyright © 2018 lu sitong. All rights reserved.
//

import Cocoa
import WebKit
import WKWebviewBridge

class ViewController: NSViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    var bridge: Bridge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bridge = Bridge(webView: myWebView, callback: swiftHandler)

        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        
        myWebView.loadFileURL(url, allowingReadAccessTo: url)
        bridge.addHandler("handler")
    }
    
    func swiftHandler(message: WKScriptMessage) {
        print(message)
    }
    
    @IBAction func handleClick(_ sender: Any) {
        myWebView.evaluateJavaScript("jsHander(\"\")")
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        bridge.removeHandler("handler")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

