//
//  theViewController.m
//  test-20160104-01
//
//  Created by qingyun on 16/1/4.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "theViewController.h"

@interface theViewController ()

@end

@implementation theViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)theExit:(UIButton *)sender {
    return exit(0);
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