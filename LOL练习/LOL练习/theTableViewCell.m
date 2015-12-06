//
//  theTableViewCell.m
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theTableViewCell.h"

#import "theFriends.h"

@implementation theTableViewCell

- (void)setFriends:(theFriends *)friends
{
    _friends = friends;
    
    self.textLabel.text = friends.name;
    self.textLabel.textColor = friends.vip ? [UIColor redColor] : [UIColor blackColor];
    self.detailTextLabel.text = friends.intro;
    self.imageView.image = [UIImage imageNamed:friends.icon];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
