//
//  ViewController.m
//  test-20151218-01
//
//  Created by qingyun on 15/12/18.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

#define kURL @"http://comic.yesky.com/imagelist/09/16/7du7j2l48vj4s.jpg"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *theImgView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loadImg:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:kURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
