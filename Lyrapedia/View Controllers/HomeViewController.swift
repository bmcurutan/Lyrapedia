//
//  HomeViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    private var viewModel = HomeViewModel()

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: tableView.rightAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.textLabel?.text = "Style \(indexPath.row + 1)"
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let card = viewModel.cards[indexPath.row]
        card.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(card)
        card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        card.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: card.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: card.rightAnchor).isActive = true
        card.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTapped(_:))))
    }

    @objc
    private func cardTapped(_ recognizer: UITapGestureRecognizer) {
        recognizer.view?.removeFromSuperview()
    }
}

private class HomeTableViewCell: UITableViewCell {
    // TODO
}
