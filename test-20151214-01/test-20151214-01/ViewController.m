//
//  ViewController.m
//  test-20151214-01
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

#import "thePerson.h"

@interface ViewController ()

@property (nonatomic, strong) thePerson *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _person = [[thePerson alloc] init];
    //注册观察者
    [_person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];
    
}

- (IBAction)changeAge:(UIButton *)sender {
    _person.age += 1;
}

//回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"age"]) {
        int oldAge = [change[@"old"] intValue];
        int newAge = [change[@"new"] intValue];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














































