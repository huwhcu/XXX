//
//  theTGTableViewCell.h
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class theTGModel;

@interface theTGTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *theIcon;
@property (weak, nonatomic) IBOutlet UILabel *theTitle;
@property (weak, nonatomic) IBOutlet UILabel *thePrice;
@property (weak, nonatomic) IBOutlet UILabel *theBuyCount;

@property (nonatomic, strong) theTGModel *model;

@end
