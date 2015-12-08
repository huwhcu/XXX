//
//  theFriendsViewController.m
//  the微信
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "theFriendsViewController.h"

#import "theFriendsModel.h"

@interface theFriendsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *theFriendsTabelView;
@property (nonatomic, strong) NSArray *theFriendsData;

@end

@implementation theFriendsViewController

static NSString *theFriendsIdentifier = @"FriendsCell";

#pragma mark - 模型转换

- (NSArray *)theFriendsDataArray
{
    if (_theFriendsData == nil) {
        NSString *pathFriends = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *friendsArray = [NSArray arrayWithContentsOfFile:pathFriends];
        
        NSMutableArray *friendsModel = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictFriends in friendsArray) {
            theFriendsModel *friendsModels = [theFriendsModel theFriendsModelForDict:dictFriends];
            [friendsModel addObject:friendsModels];
        }
        _theFriendsData = friendsModel;
    }
    return _theFriendsData;
}

#pragma mark - 数据源

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
