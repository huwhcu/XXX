//
//  ViewController.m
//  test-20160109-01
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "ViewController.h"

#define kImg1 @"2011021715481789.jpg"
#define kImg2 @"756989486701be5f4db2ed5d46d77535"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = [UIColor grayColor].CGColor;
//    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"756989486701be5f4db2ed5d46d77535"].CGImage);
//    layer.bounds = CGRectMake(0, 0, 200, 200);
//    layer.cornerRadius = layer.bounds.size.width / 2;
//    layer.masksToBounds = YES;
//    layer.position = self.view.center;
//    [self.view.layer addSublayer:layer];
    
    UIImage *theImg = [UIImage imageNamed:kImg2];
    UIImageView *theImgView = [[UIImageView alloc] initWithImage:theImg];
    theImgView.frame = CGRectMake(0, 0, 200, 200);
    theImgView.center = self.view.center;
    theImgView.userInteractionEnabled = YES;
    theImgView.layer.masksToBounds = YES;
    theImgView.layer.cornerRadius = theImgView.bounds.size.width / 2;
    theImgView.layer.borderWidth = 3.0f;
    theImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:theImgView];
    
    CGFloat theX;
    theX = self.view.center.x;
    UIImage *theBtnImg = [UIImage imageNamed:kImg2];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setImage:theBtnImg forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 30, 200, 200);
    btn.center = self.view.center;
    btn.frame = CGRectMake(btn.frame.origin.x, 30, btn.bounds.size.width, btn.bounds.size.height);
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.bounds.size.width / 2;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 3.0f;
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
