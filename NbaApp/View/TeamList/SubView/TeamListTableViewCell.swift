//
//  TableViewCell.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import UIKit

class TeamListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        teamLogo.image = nil
        teamName.text = nil
    }

    func saveModel(model: TeamData) {
        
        teamName.text = model.full_name ?? ""
        teamLogo.forURL(model.team_logo ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
    }

}
