//
//  CityAQICell.swift
//  freshBreath
//
//  Created by Shashank Pali on 29/04/22.
//

import UIKit

final class CityAQICell: UITableViewCell {

    @IBOutlet weak var cityView: AQIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(forModel: CityModel) {
        cityView.prepare(forModel: forModel)
    }
    
}
