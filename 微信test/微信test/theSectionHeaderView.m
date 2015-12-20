//
//  theSectionHeaderView.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theSectionHeaderView.h"

#import "theFriendsGroupModel.h"

@interface theSectionHeaderView ()

@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *lable;

@end

@implementation theSectionHeaderView

static NSString *headerViewIdentifier = @"headerVIew";

+ (instancetype)sectionHeaderViewForTableView:(UITableView *)tableView {
    theSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    
    if (headerView == nil) {
        headerView = [[theSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:bgBtn];
        
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *highlightedImg = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:highlightedImg forState:UIControlStateHighlighted];
        
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lable = [[UILabel alloc] init];
        [self addSubview:lable];
        lable.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _lable = lable;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _bgBtn.frame = self.bounds;
    
    CGFloat lableW = 100;
    CGFloat lableH = self.bounds.size.height;
    CGFloat lableX = self.bounds.size.width - lableW - 10;
    CGFloat lableY = 0;
    _lable.frame = CGRectMake(lableX, lableY, lableW, lableH);
}

- (void)bgBtnClick:(UIButton *)btn {
    _friendGroup.isOpen = !_friendGroup.isOpen;
    if (_headerViewClick) {
        _headerViewClick();
    }
}

- (void)setFriendGroup:(theFriendsGroupModel *)friendGroup {
    _friendGroup = friendGroup;
    
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _lable.text = [NSString stringWithFormat:@"%ld/%ld", friendGroup.online, friendGroup.friends.count];
    
    if (_friendGroup.isOpen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
