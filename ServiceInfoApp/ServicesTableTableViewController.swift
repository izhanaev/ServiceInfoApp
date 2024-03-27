//
//  ServicesTableTableViewController.swift
//  ServiceInfoApp
//
//  Created by Ильяс Жанаев on 26.03.2024.
//

import UIKit

class ServicesTableViewController: UITableViewController {
    
    var services: [SocNetwork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ServiceCell.self, forCellReuseIdentifier: ServiceCell.identifier)
        
        title = "Сервисы"
        
        fetchData()
    }
    
    func fetchData() {
        Task {
            do {
                let arr = try await NetClient().fetchData()
                services = arr
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ServiceCell.identifier, for: indexPath) as? ServiceCell else {
            fatalError("Unable to dequeue ServiceCell")
        }
        
        let service = services[indexPath.row]
        cell.serviceNameLabel.text = service.name
        cell.serviceDescriptionLabel.text = service.description
        
        Task {
            do {
                if let imageUrl = URL(string: service.icon_url) {
                    let (data, _) = try await URLSession.shared.data(from: imageUrl)
                    DispatchQueue.main.async {
                        cell.serviceImageView.image = UIImage(data: data)
                    }
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let service = services[indexPath.row]
        guard let url = URL(string: service.link) else {
            print("Invalid URL")
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open URL")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
