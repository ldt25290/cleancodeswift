//
//  MoviesRouter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesRouterProtocol {

    weak var viewController: MoviesViewController? { get }

    func navigateToSomewhere()
    
    func navigateTouchMovieViewController()
}

final class MoviesRouter {

    weak var viewController: MoviesViewController?


    // MARK: - Initializers

    init(viewController: MoviesViewController?) {

        self.viewController = viewController
    }
}


// MARK: - MoviesRouterProtocol

extension MoviesRouter: MoviesRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
    
    func navigateTouchMovieViewController() {
        let tochViewController = TouchMovieViewController()
        self.viewController?.present(tochViewController, animated: true, completion: nil)
    }
}
