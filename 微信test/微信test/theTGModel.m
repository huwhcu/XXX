//
//  theTGModel.m
//  微信test
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 QingYun. All rights reserved.
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
