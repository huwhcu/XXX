//
//  ViewController.m
//  test-20151219-01
//
//  Created by qingyun on 15/12/19.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *theTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loadText:(UIButton *)sender {
    __block NSString *theData;
    __block NSString *chuLi1;
    __block NSString *chuLi2;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_group_t group = dispatch_group_create();
        
        theData = [self stringData];
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            chuLi1 = [self handlFirst:theData];
        });
    });
}

- (NSString *)stringData {
    [NSThread sleepForTimeInterval:2];
    return @"The quickly brown fox jumps over the lazy dog.";
}

- (NSString *)handlFirst:(NSString *)string {
    return nil;
}

- (NSString *)handlSecend:(NSString *)string {
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
