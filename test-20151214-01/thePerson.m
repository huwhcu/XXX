//
//  thePerson.m
//  test-20151214-01
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "thePerson.h"

@implementation thePerson

- (instancetype)init{
    if (self = [super init]) {
        _name = @"Mark";
        _age = 21;
    }
    return self;
}

@end
