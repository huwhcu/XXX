//
//  ViewController.m
//  LOL练习
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "ViewController.h"

#import "theFriends.h"
#import "theFriendsGroup.h"
#import "theTableViewCell.h"
#import "theSectionHeaderView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

- (NSArray *)heros
{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            theFriendsGroup *friendsGroup = [theFriendsGroup friendsGroupFromDict:dict];
            [models addObject:friendsGroup];
        }
        _heros = models;
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.heros.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    theFriendsGroup *friendGroup = self.heros[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    theTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[theTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    theFriendsGroup *friendGroup = self.heros[indexPath.section];
    theFriends *friend = friendGroup.friends[indexPath.row];
    cell.friends = friend;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    theSectionHeaderView *headerView = [theSectionHeaderView sectionHeaderViewForTableView:tableView];
    theFriendsGroup *friendGroup = self.heros[section];
    headerView.friendsGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        [tableView reloadData];
    };
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
