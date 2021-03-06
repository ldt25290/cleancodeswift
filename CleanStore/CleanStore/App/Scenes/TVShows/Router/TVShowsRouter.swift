//
//  TVShowsRouter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsRouterProtocol {

    weak var viewController: TVShowsViewController? { get }

    func navigateToSomewhere()
    func navigateToTouchTVShowsViewController()
}

final class TVShowsRouter {

    weak var viewController: TVShowsViewController?


    // MARK: - Initializers

    init(viewController: TVShowsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - TVShowsRouterProtocol

extension TVShowsRouter: TVShowsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
    
    func navigateToTouchTVShowsViewController() {
        let touchTVViewController = TouchTVShowsViewController()
        viewController?.present(touchTVViewController, animated: true, completion: nil)
    }
}
