//
//  PullRequestsViewController.swift
//  Github public All Closed Pull Requests
//
//  Created by Admin on 02/08/22.
//

import UIKit

class PullRequestsViewController: UIViewController {
    
    @IBOutlet weak var dataLoadingView: UIView!
    @IBOutlet weak var requestsTableView: UITableView!
    
    private var repositoryData : [gitRepositoryData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLoadingView.isHidden = false
        let ns = networkService()
        ns.loadData { data, error in
            if data != nil{
                self.repositoryData = data!
                DispatchQueue.main.async {
                    self.dataLoadingView.isHidden = true
                    self.requestsTableView.reloadData()
                }
                print(self.repositoryData[0].name)
            }
        }

        self.requestsTableView.register(UINib(nibName: "RequestsTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestsTableViewCell")
    }
    

}

extension PullRequestsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = requestsTableView.dequeueReusableCell(withIdentifier: "RequestsTableViewCell", for: indexPath) as! RequestsTableViewCell
        cell.title.text = self.repositoryData[indexPath.row].name
        cell.userName.text = self.repositoryData[indexPath.row].owner.login
        cell.createdDate.text = self.repositoryData[indexPath.row].created_at
        cell.closedDate.text = self.repositoryData[indexPath.row].updated_at
        cell.userImage.image = UIImage(url: URL(string: self.repositoryData[indexPath.row].owner.avatar_url ?? "https://avatars.githubusercontent.com/u/19324077?v=4"))
        return cell
    }
    
    
}


