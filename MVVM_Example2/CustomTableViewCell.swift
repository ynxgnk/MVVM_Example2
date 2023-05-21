//
//  CustomTableViewCell.swift
//  MVVM_Example2
//
//  Created by Nazar Kopeyka on 11.05.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel! /* 23 */
    
    static let cellIdentifier = "CustomTableViewCell" /* 28 */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib { /* 24 */
        return UINib(nibName: "CustomTableViewCell", bundle: nil) /* 25 */
    }
    
    public func configure(with viewModel: CellViewModel) { /* 26 */
        myLabel.text = "\(viewModel.firstName) \(viewModel.lastName)" /* 27 */
    }
    
}
