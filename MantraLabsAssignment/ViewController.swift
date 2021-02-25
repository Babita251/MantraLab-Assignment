//
//  ViewController.swift
//  MantraLabsAssignment
//
//  Created by babita pal on 24/02/21.
//

import UIKit

public class SubCategory {
    let name: String
    let displayName: String
    
    public init(name: String, displayName: String) {
        self.name = name
        self.displayName = displayName
    }
}

public class Fruit {

    public let name: String

    public let subCategory: [SubCategory]

    public var expend: Bool = false
    
    public init(name: String, subCategory: [SubCategory]) {
        self.name = name
        self.subCategory = subCategory
     
    }

}

class ViewController: UIViewController {

    @IBOutlet weak var viewParentView: UIView!
    @IBOutlet weak var tblList: UITableView!
    
    private var dataArr: [Fruit] = []
    private var mTableData: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        registerCells()
        // Do any additional setup after loading the view.
    }
    private func registerCells() {
        tblList.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        tblList.register(UINib(nibName: "SubcateoryTableViewCell", bundle: nil), forCellReuseIdentifier: "SubcateoryTableViewCell")
        
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.separatorStyle = .none
        
    }

    

    func parseData() {
        let url = Bundle.main.url(forResource:"menu", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let JSON = try! JSONSerialization.jsonObject(with: jsonData, options: [])
        if let arr = JSON as? [[String: AnyObject]] {
            for obj in arr {
                var subCateArr: [SubCategory] = []
                if let ss = obj["name"] as? String,let subCategoryArr = obj["sub_category"] as? [[String: String]] {
                    for subCategory in subCategoryArr {
                        if let name = subCategory["name"] as? String,let displayName = subCategory["display_name"] as? String {
                            subCateArr.append(SubCategory(name: name, displayName: displayName))
                        }
                    }
                    dataArr.append(Fruit(name: ss, subCategory: subCateArr))
                }
            }
        }
//        mTableData = dataArr
        setData()
        tblList.reloadData()
    }

    private func setData() {
        mTableData = []
        for obj in dataArr {
            mTableData.append(obj)
            if obj.expend == true {
                mTableData.append(contentsOf: obj.subCategory)
            }
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = mTableData[indexPath.row]
        if let category = obj as? SubCategory {
            let height = heightForView(text: category.displayName, font:fontSize14, width:tableView.frame.size.width - 66) + 30
            return height
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = mTableData[indexPath.row]
        if let category = obj as? Fruit {
            if let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as? MenuTableViewCell {
                cell.selectionStyle = .none
                cell.btnExpand.tintColor = COMMON_SUBTITLE_COLOR
                if category.expend == false {
                    let image = UIImage(named: "down-arrow")?.withRenderingMode(.alwaysTemplate)
                    cell.btnExpand.setImage(image, for: .normal)
                    
                } else {
                    let image = UIImage(named: "upwardArrow")?.withRenderingMode(.alwaysTemplate)
                    cell.btnExpand.setImage(image, for: .normal)
                }
                
                cell.lblTitle.text = category.name
                cell.delegate = self
                cell.menuObj = category
                return cell
            }
        } else if let subCategory = obj as? SubCategory {
            
            if let cell: SubcateoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubcateoryTableViewCell") as? SubcateoryTableViewCell {
                cell.selectionStyle = .none
                cell.lblTitle.text = subCategory.name
                cell.lblSubTitle.text = subCategory.displayName
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}

extension ViewController: MenuTableViewCellDelegate {
    func expandCollapseRow(menuObj: Fruit) {
        setData()
        tblList.reloadData()
    }
}
