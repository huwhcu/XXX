//
//  theTGScrollView.h
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface theTGScrollView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *theTGScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *theTGPageControl;
@property (nonatomic, strong) NSArray *imageName;

+ (instancetype)pageScroll;

@end
