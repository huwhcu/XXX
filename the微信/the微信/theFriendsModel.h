//
//  theFriendsModel.h
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriendsModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic) BOOL *vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)theFriendsModelForDict:(NSDictionary *)dict;

@end
