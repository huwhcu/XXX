//
//  theFriendsModel.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theFriendsModel.h"

@implementation theFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)theFriendsModelForDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
