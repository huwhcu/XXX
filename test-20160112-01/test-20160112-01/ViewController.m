//
//  ViewController.m
//  test-20160112-01
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *theView1;
@property (nonatomic, strong) UIView *theView2;
@property (nonatomic, strong) UIView *theView3;
@property (nonatomic, strong) UIButton *theBtn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _theView1 = [[UIView alloc] init];
    _theView2 = [[UIView alloc] init];
    _theView3 = [[UIView alloc] init];
    _theBtn1 = [[UIButton alloc] init];
    [self.view addSubview:_theView1];
    [self.view addSubview:_theView2];
    [self.view addSubview:_theView3];
    [self.view addSubview:_theBtn1];
}

- (void)setupLayout {
    _theView1.backgroundColor = [UIColor redColor];
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_theView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding.top);
        make.left.equalTo(superview.mas_left).with.offset(padding.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
    }];
    
    _theView2 setBackgroundColor:[UIColor greenColor];
    [_theView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding.top);
        make.left.equalTo(superview.mas_left).with.offset(padding.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
    }];
    
    _theView3.backgroundColor = [UIColor blueColor];
    [_theView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding.top);
        make.left.equalTo(superview.mas_left).with.offset(padding.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
    }];
    
    _theBtn1.titleLabel.text = @"Name";
    [_theBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding.top);
        make.left.equalTo(superview.mas_left).with.offset(padding.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
