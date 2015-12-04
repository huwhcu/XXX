//
//  theTableViewCell.h
//  团购
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class theModels;

@interface theTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *theTitle;
@property (weak, nonatomic) IBOutlet UILabel *thePrice;
@property (weak, nonatomic) IBOutlet UILabel *theBuycount;
@property (weak, nonatomic) IBOutlet UIImageView *theIcon;

@property (nonatomic, strong) theModels *model;

@end
