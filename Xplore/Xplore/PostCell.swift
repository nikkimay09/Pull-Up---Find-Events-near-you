//
//  PostCell.swift
//  Xplore
//
//  Created by yipeng li on 11/17/21.
//

import UIKit
import Parse

protocol CellDelegate{
    
    func onCellDelete(indexPath: IndexPath)
}

class PostCell: UITableViewCell  {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    var delegate: CellDelegate?
    var liked:Bool = false
    var posts = [PFObject]()
    
    @IBAction func LikePic(_ sender: Any) {
        
        liked = !liked
        setLike(_isLiked: liked)
        
        // Get the post being liked/unliked
        let indexPath = getIndexPath()
        let post = posts[indexPath!.section]
        // set "favorited" to self.liked
        post["favorited"] = self.liked
        // save the post
        post.saveInBackground()
    }
    
    func getIndexPath()  -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        
        let indexPath = superView.indexPath(for: self)!
        return indexPath
    }

    
    func setLike(_isLiked:Bool){
    
        if (_isLiked){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onDelete(_ sender: Any) {
        print("DELETING POST...")
        let indexPath = getIndexPath()!
        let post = posts[indexPath.section]
        post.deleteInBackground{ (success, error) in
            if success {
                print("DELETE SUCCESSFUL")
                self.delegate?.onCellDelete(indexPath: indexPath)
            } else {
                print("error deleting on parse server \(error.debugDescription)")
            }
        }
        
    }
    

}
