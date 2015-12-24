//
//  theTGTableViewCell.m
//  微信2ed
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "theTGTableViewCell.h"

#import "theTGModels.h"

@interface theTGTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *theIcon;
@property (weak, nonatomic) IBOutlet UILabel *theTitle;
@property (weak, nonatomic) IBOutlet UILabel *thePrice;
@property (weak, nonatomic) IBOutlet UILabel *theBuycount;

@end

@implementation theTGTableViewCell

- (void)setModel:(theTGModels *)tgModel {
    _tgModel = tgModel;
    
    _theIcon.image = [UIImage imageNamed:tgModel.icon];
    _theTitle.text = tgModel.title;
    _thePrice.text = tgModel.price;
    _theBuycount.text = tgModel.buycount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
