//
//  theAlbumViewController.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theAlbumViewController.h"

#import "theZoomScrollView.h"

#define screenW     [UIScreen mainScreen].bounds.size.width
#define screenH     [UIScreen mainScreen].bounds.size.height
#define theCount    3

@interface theAlbumViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scorllView;

@end

@implementation theAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addScorllView];
    [self addZoomScrollViewForScrollView];
}

- (void)addScorllView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenW + 25, screenH)];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake((screenW + 25) * theCount, screenH);
    
    scrollView.delegate = self;
    
    scrollView.pagingEnabled = YES;
    
    scrollView.backgroundColor = [UIColor blackColor];
    
    _scorllView = scrollView;
}

- (void)addZoomScrollViewForScrollView {
    for (int i = 0; i < theCount; i++) {
        theZoomScrollView *zoomScrollView = [[theZoomScrollView alloc] initWithFrame:CGRectMake((screenW + 25) * i, 0, screenW, screenH)];
        [_scorllView addSubview:zoomScrollView];
        
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        zoomScrollView.img = [UIImage imageNamed:imgName];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    for (id object in scrollView.subviews) {
        if ([object isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scroll = (UIScrollView *)object;
            scroll.zoomScale = 1.0;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end









