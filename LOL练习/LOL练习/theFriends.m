//
//  theFriends.m
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theFriends.h"

@implementation theFriends

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendsFromDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
