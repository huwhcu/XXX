//
//  theFriendsGroup.m
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theFriendsGroup.h"

#import "theFriends.h"

@implementation theFriendsGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            theFriends *friend = [theFriends friendsFromDict:dic];
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}

+(instancetype)friendsGroupFromDict:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
