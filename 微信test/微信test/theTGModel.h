//
//  theTGModel.h
//  微信test
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theTGModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *buycount;
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)theTGModelForDict:(NSDictionary *)dict;

@end
