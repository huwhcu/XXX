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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
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
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            chuLi2 = [self handlSecend:theData];
        });
        
        dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *result;
            result = [NSString stringWithFormat:@"%@\r%@", chuLi1, chuLi2];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _theTextView.text = result;
            });
        });
    });
}

- (NSString *)stringData {
    [NSThread sleepForTimeInterval:2];
    return @"The quickly brown fox jumps over the lazy dog.";
}

- (NSString *)handlFirst:(NSString *)string {
    [NSThread sleepForTimeInterval:2];
    return [string uppercaseString];
}

- (NSString *)handlSecend:(NSString *)string {
    [NSThread sleepForTimeInterval:1];
    return [string stringByReplacingOccurrencesOfString:@"o" withString:@"e"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
