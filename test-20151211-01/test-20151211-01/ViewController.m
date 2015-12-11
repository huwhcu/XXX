//
//  ViewController.m
//  test-20151211-01
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *theMagentaSquare;
@property (weak, nonatomic) IBOutlet UIImageView *theCyanSquare;
@property (weak, nonatomic) IBOutlet UIImageView *theYellowSquare;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark - 开始点击
//图片放大1.2倍，center移动至触摸点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
//        UIImageView *imgView = (UIImageView *)touch.view;
//
//        [UIView animateWithDuration:0.3 animations:^{
//            imgView.center = location;
//            imgView.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        }];
    
    if   (CGRectContainsPoint(_theCyanSquare.frame, location)
        ||CGRectContainsPoint(_theMagentaSquare.frame, location)
        ||CGRectContainsPoint(_theYellowSquare.frame, location))
    {
        if (CGRectContainsPoint(_theCyanSquare.frame, location))
        {
            [UIView animateWithDuration:0.3 animations:^{
                _theCyanSquare.center = location;
                _theCyanSquare.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }];
        }
        
        if (CGRectContainsPoint(_theMagentaSquare.frame, location))
        {
            [UIView animateWithDuration:0.3 animations:^{
                _theMagentaSquare.center = location;
                _theMagentaSquare.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }];
        }
        
        if (CGRectContainsPoint(_theYellowSquare.frame, location))
        {
            [UIView animateWithDuration:0.3 animations:^{
                _theYellowSquare.center = location;
                _theYellowSquare.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }];
        }
        
    } else{
        if (touch.tapCount == 2) {
            [self resetFrame];
        }
    }
}

#pragma mark - 点住移动
//图片跟随触摸点移动，且在触摸点进入另一图片时也将该图center置为触摸点，并跟随移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
//    if   (CGRectContainsPoint(_theCyanSquare.frame, point)
//        ||CGRectContainsPoint(_theMagentaSquare.frame, point)
//        ||CGRectContainsPoint(_theYellowSquare.frame, point))
//    {
//        UIImageView *imgViews = (UIImageView *)touch.view;
//        [UIView animateWithDuration:0.1 animations:^{
//            imgViews.center = point;
//        }];
//    }
    
    if (CGRectContainsPoint(_theCyanSquare.frame, point))
    {
        [UIView animateWithDuration:0.05 animations:^{
            _theCyanSquare.center = point;
        }];
    }
    
    if (CGRectContainsPoint(_theMagentaSquare.frame, point))
    {
        [UIView animateWithDuration:0.05 animations:^{
            _theMagentaSquare.center = point;
        }];
    }
    
    if (CGRectContainsPoint(_theYellowSquare.frame, point))
    {
        [UIView animateWithDuration:0.05 animations:^{
            _theYellowSquare.center = point;
        }];
    }
}

#pragma mark - 点击结束
//还原原始图片
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch = [touches anyObject];
    
//    UIImageView *imageView = (UIImageView *)touch.view;
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        imageView.transform = CGAffineTransformIdentity;
//    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        _theCyanSquare.transform = CGAffineTransformIdentity;
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        _theMagentaSquare.transform = CGAffineTransformIdentity;
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        _theYellowSquare.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - 双击还原
//双击时，是图片的状态（大小、位置）还原为初始

- (void)resetFrame
{
    [UIView animateWithDuration:0.5 animations:^{
        _theCyanSquare.frame = CGRectMake(123, 270, 100, 100);
        _theMagentaSquare.frame = CGRectMake(20, 20, 100, 100);
        _theYellowSquare.frame = CGRectMake(255, 547, 100, 100);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
