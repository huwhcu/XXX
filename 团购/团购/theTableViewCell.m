//
//  theTableViewCell.m
//  团购
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theTableViewCell.h"

#import "theModels.h"

@implementation theTableViewCell

- (void)setModel:(theModels *)model
{
    _model = model;
    
    _theTitle.text = model.title;
    _thePrice.text = model.price;
    _theBuycount.text = model.buycount;
    _theIcon.image = [UIImage imageNamed:model.icon];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
