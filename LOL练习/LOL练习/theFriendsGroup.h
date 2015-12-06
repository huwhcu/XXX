//
//  theFriendsGroup.h
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriendsGroup : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic) NSInteger online;
@property (nonatomic) BOOL isopen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsGroupFromDict:(NSDictionary *)dict;

@end
