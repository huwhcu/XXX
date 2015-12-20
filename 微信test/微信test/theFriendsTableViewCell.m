//
//  theFriendsTableViewCell.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theFriendsTableViewCell.h"

#import "theFriendsModel.h"

@implementation theFriendsTableViewCell

- (void)setFriend:(theFriendsModel *)friend {
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.status;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
