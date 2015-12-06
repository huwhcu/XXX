//
//  theFriends.h
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriends : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsFromDict:(NSDictionary *)dict;

@end
