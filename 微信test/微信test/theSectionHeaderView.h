//
//  theSectionHeaderView.h
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class theFriendsGroupModel;

@interface theSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) theFriendsGroupModel *friendGroup;
@property (nonatomic, strong) void (^headerViewClick)(void);

+ (instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;

@end
