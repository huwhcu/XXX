//
//  theSectionHeaderView.h
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class theFriendsGroup;

@interface theSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) theFriendsGroup *friendsGroup;
@property (nonatomic, strong) void (^headerViewClick)(void);

+ (instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;

@end
