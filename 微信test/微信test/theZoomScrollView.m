//
//  theZoomScrollView.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theZoomScrollView.h"

@interface theZoomScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation theZoomScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imgView];
        _imgView = imgView;
        
        self.delegate = self;
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.5;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)doubleClick:(UITapGestureRecognizer *)tap {
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    
    CGPoint point = [tap locationInView:self];
    CGRect rect = CGRectMake(point.x - 100, point.y - 100, 200, 200);
    
    [self zoomToRect:rect animated:YES];
}

- (void)setImg:(UIImage *)img {
    _img = img;
    _imgView.image = img;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imgView;
}

@end
