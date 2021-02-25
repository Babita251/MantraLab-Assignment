//
//  MenuTableViewCell.swift
//  MantraLabsAssignment
//
//  Created by babita pal on 24/02/21.
//

import UIKit

protocol MenuTableViewCellDelegate: class {
    func expandCollapseRow(menuObj: Fruit)
}

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var viewParentView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    var menuObj: Fruit?
    weak var delegate: MenuTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = semiBoldFontSize16
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnExpandTapped(_ sender: UIButton!) {
        
        if var obj = menuObj {
            obj.expend = !obj.expend
            delegate?.expandCollapseRow(menuObj: obj)
        }   
    }
}
