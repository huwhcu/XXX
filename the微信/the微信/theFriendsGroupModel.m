//
//  theFriendsGroupModel.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theFriendsGroupModel.h"

#import "theFriendsModel.h"

@implementation theFriendsGroupModel

- (instancetype)initWithDitc:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *theDict in self.friends) {
            theFriendsModel *theFriends = [theFriendsModel theFriendsModelForDict:theDict];
            [array addObject:theFriends];
        }
        self.friends = array;
    }
    return self;
}

+ (instancetype)theFriendsGroupForDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDitc:dict];
}

@end
