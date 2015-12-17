//
//  theFriendsModel.m
//  微信test
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theFriendsModel.h"

@implementation theFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)theFriendsWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
