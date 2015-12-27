//
//  ProfessorTableViewCell.swift
//  Profsquire
//
//  Created by Riyang Liu on 10/3/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class ProfessorTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfessorCardView: UIView!
    @IBOutlet weak var CardViewImage: UIImageView!
    @IBOutlet weak var ProfessorNameLabel: UILabel!
    @IBOutlet weak var SubLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
        cardSetup()
        imageSetup()
    }
    
    func cardSetup() {
        
        ProfessorCardView.alpha = 1
        ProfessorCardView.layer.masksToBounds = false;
        ProfessorCardView.layer.cornerRadius = 1
        ProfessorCardView.layer.shadowOffset = CGSizeMake(-0.1, 0.1)
        ProfessorCardView.layer.shadowRadius = 1;
        let path:UIBezierPath = UIBezierPath.init(rect: ProfessorCardView.bounds)
        ProfessorCardView.layer.shadowPath =
            path.CGPath
        ProfessorCardView.layer.shadowOpacity = 0.2
        
    }
    
    func imageSetup() {
        
        CardViewImage.layer.cornerRadius = CardViewImage.frame.size.width/2;
        CardViewImage.clipsToBounds = true
        CardViewImage.contentMode = UIViewContentMode.ScaleAspectFit;
        CardViewImage.backgroundColor = UIColor.whiteColor()
    }
    
    


}
