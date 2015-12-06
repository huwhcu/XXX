//
//  theTGScrollView.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theTGScrollView.h"

@implementation theTGScrollView

+ (instancetype)pageScroll
{
    return [[[NSBundle mainBundle] loadNibNamed:@"theTGScrollView" owner:nil options:nil] lastObject];
}

- (void)setImageName:(NSArray *)imageName
{
    _imageName = imageName;
    
    for (int i = 0; i < imageName.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:_imageName[i]];
        [self.theTGScrollView addSubview:imgView];
    }
    self.theTGPageControl.numberOfPages = _imageName.count;
    self.theTGScrollView.pagingEnabled = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.theTGScrollView.frame = self.bounds;
    CGFloat viewW = self.theTGScrollView.frame.size.width;
    CGFloat viewH = self.theTGScrollView.frame.size.height;
    
    self.theTGScrollView.contentSize = CGSizeMake(viewW * _imageName.count, 0);
    
    self.theTGPageControl.frame = CGRectMake(viewW - 100, viewH - 20, 100, 20);
    
    for (int i = 0; i < _imageName.count; i++) {
        UIImageView *theImgView = self.theTGScrollView.subviews[i];
        theImgView.frame = CGRectMake(viewW * i, 0, viewW, viewH);
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
