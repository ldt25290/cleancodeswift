//
//  TVShowsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsViewControllerInput: TVShowsPresenterOutput {

}

protocol TVShowsViewControllerOutput {

    func doSomething()
}

final class TVShowsViewController: UIViewController {

    var output: TVShowsViewControllerOutput!
    var router: TVShowsRouterProtocol!
    
    var tvShowsBackgrounColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var tvShowsForegroundColor: UIColor = UIColor(red: 26.0/255.0, green: 206.0/255.0, blue: 239.0/255.0, alpha: 1)

    lazy var tvShowsTableView: UITableView = { [unowned self] in
        
        var tableView = UITableView()
        tableView.register(TVShowsTableViewCell.nib, forCellReuseIdentifier: TVShowsTableViewCell.nibName)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    // MARK: - Initializers

    init(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        title = "TV SHOWS"
        configureControllerWhenLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutTableView()
    }
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = tvShowsBackgrounColor
        navigationController?.navigationBar.tintColor = tvShowsForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = tvShowsBackgrounColor
        tabBarController?.tabBar.tintColor = tvShowsForegroundColor
        
        title = "TV SHOWS"
        
        guard let latoBoldFont = UIFont(name: "Lato-Bold", size: 22) else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : latoBoldFont,
            NSForegroundColorAttributeName: tvShowsForegroundColor
        ]
    }
}


// MARK: - TVShowsPresenterOutput

extension TVShowsViewController: TVShowsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TVShowsViewModel) {

        // TODO: Update UI
    }
}

extension TVShowsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func constraintsLayoutTableView() {
        [tvShowsTableView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes: [NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.tvShowsTableView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVShowsTableViewCell.nibName, for: indexPath) as! TVShowsTableViewCell
        return cell
    }
}
