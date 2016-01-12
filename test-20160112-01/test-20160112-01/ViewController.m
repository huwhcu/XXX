//
//  ViewController.m
//  test-20160112-01
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *theView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    _theView1 = [[UIView alloc] init];
    _theView1.backgroundColor= [UIColor redColor];
    [self.view addSubview:_theView1];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(20, 20, 20, 20);
    
    [_theView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(padding.top);
        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
