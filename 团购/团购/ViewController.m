//
//  ViewController.m
//  团购
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "ViewController.h"

#import "theModels.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

static NSString *identifier = @"cell";

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"];
        NSArray *theArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *theModelX = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in theArray) {
            theModels *models = [theModels modelWithDict:dict];
            [theModelX addObject:models];
        }
        _dataArray = theModelX;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
