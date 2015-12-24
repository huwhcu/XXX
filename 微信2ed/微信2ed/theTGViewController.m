//
//  theTGViewController.m
//  微信2ed
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "theTGViewController.h"

#import "theTGModels.h"
#import "theTGTableViewCell.h"
#import "theWebViewController.h"

@interface theTGViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *tgModels;
@property (weak, nonatomic) IBOutlet UITableView *theTGTableView;

@end

@implementation theTGViewController

- (NSMutableArray *)tgModels {
    if (_tgModels == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        _tgModels = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            theTGModels *tgModel = [theTGModels tgModelWithDict:dict];
            [_tgModels addObject:tgModel];
        }
    }
    return _tgModels;
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    theTGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theTGCell" forIndexPath:indexPath];
    
    theTGModels *model = self.tgModels[indexPath.row];
    cell.tgModel = model;
    return cell;
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController.tabBarController setHidesBottomBarWhenPushed:YES];
    theWebViewController *webVC = [[theWebViewController alloc] init];
    webVC.urlStr = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:webVC animated:YES];
}

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
