//
//  theFriendsGroupModel.h
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriendsGroupModel : NSObject

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger *online;
@property (nonatomic) BOOL *isopen;

- (instancetype)initWithDitc:(NSDictionary *)dict;
+ (instancetype)theFriendsGroupForDict:(NSDictionary *)dict;

@end
