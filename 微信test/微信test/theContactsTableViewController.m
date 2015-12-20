//
//  theContactsTableViewController.m
//  微信test
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 QingYun. All rights reserved.
//

#import "theContactsTableViewController.h"

#import "theFriendsModel.h"
#import "theFriendsGroupModel.h"
#import "theFriendsTableViewCell.h"
#import "theSectionHeaderView.h"
#import "theResultTableViewController.h"

@interface theContactsTableViewController ()

@property (nonatomic, strong) NSMutableArray *friendsGroups;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation theContactsTableViewController

static NSString *identifier = @"contactsCell";

- (NSMutableArray *)friendsGroups {
    if (_friendsGroups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            theFriendsGroupModel *friendsGroup = [theFriendsGroupModel friendsGroupWithDict:dict];
            [models addObject:friendsGroup];
        }
        _friendsGroups = models;
    }
    return _friendsGroups;
}

- (IBAction)searchItemClick:(UIBarButtonItem *)sender {
    [self presentViewController:_searchController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    theResultTableViewController *resultTableViewController = [[theResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    resultTableViewController.datas = self.friendsGroups;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resultTableViewController];
    
    _searchController.searchResultsUpdater = resultTableViewController;
//    _searchController.hidesNavigationBarDuringPresentation = YES;
//    _searchController.dimsBackgroundDuringPresentation = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendsGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    theFriendsGroupModel *friendsGroup = self.friendsGroups[section];
    if (friendsGroup.isOpen) {
        return friendsGroup.friends.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    theFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[theFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    theFriendsGroupModel *friendGroup = self.friendsGroups[indexPath.section];
    theFriendsModel *friend = friendGroup.friends[indexPath.row];
    cell.friend =friend;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    theSectionHeaderView *headerView = [theSectionHeaderView sectionHeaderViewForTableView:tableView];
    theFriendsGroupModel *friendGroup = self.friendsGroups[section];
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        [tableView reloadData];
    };
    return headerView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
