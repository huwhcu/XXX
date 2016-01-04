//
//  theTableViewCell.m
//  test-20151229-01
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "theTableViewCell.h"

@interface theTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *theImg;
@property (weak, nonatomic) IBOutlet UILabel *theTitle;
@property (weak, nonatomic) IBOutlet UILabel *theLocal;
@property (weak, nonatomic) IBOutlet UILabel *theHuXing;
@property (weak, nonatomic) IBOutlet UILabel *thePrice;

@end

@implementation theTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
