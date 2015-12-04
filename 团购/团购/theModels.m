//
//  theModels.m
//  团购
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theModels.h"

@implementation theModels

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
