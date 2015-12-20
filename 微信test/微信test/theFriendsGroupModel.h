//
//  theFriendsGroupModel.h
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriendsGroupModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *friends;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, assign) BOOL isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict;

@end
