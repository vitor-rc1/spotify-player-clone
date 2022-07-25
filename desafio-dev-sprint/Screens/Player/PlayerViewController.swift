//
//  ViewController.swift
//  desafio-dev-sprint
//
//  Created by Vitor Conceicao on 22/07/22.
//

import UIKit

final class PlayerViewController: UIViewController {
    
    private lazy var customView: UIView = PlayerView()
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

