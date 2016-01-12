//
//  ViewController.m
//  test-20160106-01
//
//  Created by qingyun on 16/1/6.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "ViewController.h"

#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@property (nonatomic, assign) SystemSoundID theSound;

@end

@implementation ViewController

- (void)setSystemSound {
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"tap1" withExtension:@"caf"];
    
//    CFURLRef *url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("tap"), CFSTR("caf"), NULL);
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL), &_theSound);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)theSystemSound:(UIButton *)sender {
    [self setSystemSound];
    AudioServicesPlaySystemSound(_theSound);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
