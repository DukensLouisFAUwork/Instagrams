//
//  FeedViewController.swift
//  Instagram
//
//  Created by dwork on 10/10/22.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var posts = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = PFQuery(className:"Posts")
        
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableview.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.Usernamelabel.text = user.username
        cell.captionlabel.text = post["caption"] as? String
        
        let imageFile = post["image"] as! PFFileObject
       
        
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoview.af.setImage(withURL: url)
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
