//
//  the1stViewController.m
//  test-20160111-01
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "the1stViewController.h"

@interface the1stViewController ()

@end

@implementation the1stViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *theView1 = [[UIView alloc] init];
    theView1.backgroundColor = [UIColor redColor];
    UIView *theView2 = [[UIView alloc] init];
    theView2.backgroundColor = [UIColor greenColor];
    UIView *theView3 = [[UIView alloc] init];
    theView3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:theView1];
    [self.view addSubview:theView2];
    [self.view addSubview:theView3];
    
    [theView1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [theView2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [theView3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *theViews = NSDictionaryOfVariableBindings(self.view, theView1, theView2, theView3);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[theView1(>=100)]-[theView2(>=100)]-50-|" options:NSLayoutFormatAlignAllTop metrics:nil views:theViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[theView1(>=100)]-[theView3(>=50)]" options:0 metrics:nil views:theViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[theView2(>=100)]-[theView3(>=50)]" options:0 metrics:nil views:theViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[theView3(>=50)]-50-|" options:0 metrics:nil views:theViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[theView3(>=50)]-60-|" options:0 metrics:nil views:theViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-178-[theView3]" options:0 metrics:nil views:theViews]];
    
//    [self.view addConstraints:@[[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[theView1(>=100)]-[theView2(>=100)]-50-|"
//                                                                        options:NSLayoutFormatAlignAllTop
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                
//                                [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[theView1(>=100)]-[theView3(>=50)]"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                
//                                [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[theView2(>=100)]-[theView3(>=50)]"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                
//                                [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[theView3(>=50)]-50-|"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                
//                                [NSLayoutConstraint constraintsWithVisualFormat:@"V:[theView3(>=50)]-60-|"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                
//                                [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-178-[theView3]"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:theViews],
//                                ]];
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
