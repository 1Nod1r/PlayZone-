//
//  SettingsViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 19/09/22.
//

import UIKit

class SettingsViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = SettingsView
    let viewModel = SettingsViewModel()
    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }
    
    override func loadView() {
        super.loadView()
        //test
        view = SettingsView()
    }
    
    private func setupTargets(){
        mainView().tableView.delegate = self
        mainView().tableView.dataSource = self
        mainView().backButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goBack))
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getModel()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.defaultReuseIdentifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.switchButton.isHidden = false
            cell.rightButton.isHidden = true
        }
        cell.configure(with: viewModel.model[indexPath.row])
        return cell
    }
}
