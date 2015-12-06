//
//  theTGTableViewCell.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theTGTableViewCell.h"

#import "theTGModel.h"

@implementation theTGTableViewCell

- (void)setModel:(theTGModel *)model
{
    _model = model;
    
    _theIcon.image = [UIImage imageNamed:model.icon];
    _theTitle.text = model.title;
    _thePrice.text = model.price;
    _theBuyCount.text = model.buycount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
