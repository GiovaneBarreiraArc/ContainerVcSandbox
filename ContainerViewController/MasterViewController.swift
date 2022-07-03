//
//  ViewController.swift
//  ContainerViewController
//
//  Created by Giovane Barreira on 03/07/22.
//

import Foundation
import UIKit

final class MasterViewController: UIViewController {
    
    private var segmentedControl = UISegmentedControl()
    private let summaryVC = SummaryViewController()
    private let sessionsVC = SessionsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
     
        // Add child view controllers
        add(asChildViewController: summaryVC)
        add(asChildViewController: sessionsVC)
        setupSegmentedControl()
    }
    
    func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        self.navigationItem.prompt = "Container View Controller"
        self.navigationItem.titleView = segmentedControl
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: sessionsVC)
            add(asChildViewController: summaryVC)
        } else {
            remove(asChildViewController: summaryVC)
            add(asChildViewController: sessionsVC)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewContoller: UIViewController) {
        // Notify Child View Controller
        viewContoller.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewContoller.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewContoller.removeFromParent()
    }
}
