//
//  SummaryViewController.swift
//  ContainerViewController
//
//  Created by Giovane Barreira on 03/07/22.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("Summary View Controller Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print("Summary View Controller Will Disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        style()
        layout()
    }
}

extension SummaryViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Summary View Controller"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
