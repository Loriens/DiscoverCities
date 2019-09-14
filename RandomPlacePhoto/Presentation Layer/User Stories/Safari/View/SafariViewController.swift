//
//  SafariViewController.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import WebKit

// TODO: - Решить проблему с прозрачным navigationBar
class SafariViewController: UIViewController, SafariViewInput {

    // MARK: - Outlets
    private var webView: WKWebView!
    
    // MARK: - Props
    var output: SafariViewOutput?
    
    // MARK: - Lifecycle
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.loadData()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - SafariViewInput
    func updateSite(with site: Site) {
        navigationItem.title = site.title
        guard let url = URL(string: site.url) else { return }
        guard Reachability.isConnectedToNetwork() else {
            Toast.instance.show(title: AppLocalization.General.error.localized, message: InternetConnectionError().localizedDescription)
            return
        }
        webView.load(URLRequest(url: url))
    }
    
}

// MARK: - Setup functions
extension SafariViewController {
    
    func setupComponents() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension SafariViewController { }

// MARK: - Module functions
extension SafariViewController { }

// MARK: - WKUIDelegate
extension SafariViewController: WKUIDelegate { }
