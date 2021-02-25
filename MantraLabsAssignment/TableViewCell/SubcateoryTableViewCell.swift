//
//  SubcateoryTableViewCell.swift
//  MantraLabsAssignment
//
//  Created by babita pal on 24/02/21.
//

import UIKit

//protocol MenuTableViewCellDelegate: class {
//    func expandCollapseRow(menuObj: Fruit)
//}

class SubcateoryTableViewCell: UITableViewCell {

    @IBOutlet weak var viewParentView: UIView!
    @IBOutlet weak var leadingContraint: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
//    var menuObj: Fruit?
//    weak var delegate: MenuTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = fontSize16
        lblSubTitle.font = fontSize14
        lblSubTitle.textColor = COMMON_SUBTITLE_COLOR
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func btnExpandTapped(_ sender: UIButton!) {
//
//        if var obj = menuObj {
//            obj.expend = !obj.expend
//            delegate?.expandCollapseRow(menuObj: obj)
//        }
//    }
}
