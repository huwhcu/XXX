//
//  theFriendsGroupModel.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theFriendsGroupModel.h"

#import "theFriendsModel.h"

@implementation theFriendsGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *friends = [NSMutableArray array];
        for (NSDictionary *friendsDict in self.friends) {
            theFriendsModel *friend = [theFriendsModel theFriendsWithDict:friendsDict];
            [friends addObject:friend];
        }
        self.friends = friends;
    }
    return self;
}

+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
