//
//  theTGModels.h
//  微信2ed
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theTGModels : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *buycount;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgModelWithDict:(NSDictionary *)dict;

@end
