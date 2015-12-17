//
//  theFriendsModel.h
//  微信test
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theFriendsModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *status;
@property (nonatomic) BOOL *vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)theFriendsWithDict:(NSDictionary *)dict;

@end
