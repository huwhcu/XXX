//
//  theTGModels.m
//  微信2ed
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "theTGModels.h"

@implementation theTGModels

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
