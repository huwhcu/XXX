//
//  ViewController.m
//  团购
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "ViewController.h"

#import "theModels.h"
#import "theTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

//  注册标识
static NSString *identifier = @"cell";

#pragma mark - 模型转换
//  转模型
- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *theArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *theModelX = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in theArray) {
            theModels *models = [theModels modelWithDict:dict];
            [theModelX addObject:models];
        }
        _dataArray = theModelX;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView.rowHeight = 100;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    theTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"theTableViewCell" owner:self options:nil][0];
    }
    
    theModels *theModels = self.dataArray[indexPath.row];
    cell.model = theModels;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
