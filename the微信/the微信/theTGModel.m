//
//  theTGModel.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theTGModel.h"

@implementation theTGModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)theTGModelForDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
