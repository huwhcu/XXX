//
//  theSectionHeaderView.m
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theSectionHeaderView.h"

#import "theFriendsGroup.h"

@interface theSectionHeaderView ()

@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *label;

@end

@implementation theSectionHeaderView

static NSString *headerViewIdentifier = @"headerView";

+ (instancetype)sectionHeaderViewForTableView:(UITableView *)tableView
{
    theSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[theSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:bgBtn];
        
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *highlightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        bgBtn.imageView.contentMode  = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _label = label;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgBtn.frame = self.bounds;
    
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

- (void)bgBtnClick:(UIButton *)btn
{
    _friendsGroup.isopen = !_friendsGroup.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
}

- (void)setFriendsGroup:(theFriendsGroup *)friendsGroup
{
    _friendsGroup = friendsGroup;
    
    [_bgBtn setTitle:friendsGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld", friendsGroup.online, friendsGroup.friends.count];
    
    if (_friendsGroup.isopen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
