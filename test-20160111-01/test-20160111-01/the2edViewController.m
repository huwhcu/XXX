//
//  the2edViewController.m
//  test-20160111-01
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "the2edViewController.h"

@interface the2edViewController ()

@end

@implementation the2edViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    CGRect viewFrame = CGRectMake(50.f, 100.f, 150.f, 150.f);
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view, view);
    NSDictionary *metrics = @{@"left": @(CGRectGetMinX(viewFrame)),
                              @"top": @(CGRectGetMinY(viewFrame)),
                              @"width": @(CGRectGetWidth(viewFrame)),
                              @"height": @(CGRectGetHeight(viewFrame))};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[view(>=width)]" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[view(>=height)]" options:0 metrics:metrics views:views]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
