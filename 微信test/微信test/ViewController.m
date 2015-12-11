//
//  ViewController.m
//  微信test
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "ViewController.h"

#import "theTGModel.h"
#import "theTGTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *theTGData;
@property (weak, nonatomic) IBOutlet UITableView *theTGTableView;

@end

@implementation ViewController

static NSString *theTGIdentifier = @"TGCell";

#pragma mark - TG的模型转换

- (NSArray *)theTGDataArray
{
    if (_theTGData == nil) {
        NSString *pathTG = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *theArray = [NSArray arrayWithContentsOfFile:pathTG];
        
        NSMutableArray *theModel = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in theArray) {
            theTGModel *model = [theTGModel theTGModelForDict:dict];
            [theModel addObject:model];
        }
        _theTGData = theModel;
    }
    return _theTGData;
}

#pragma mark - TG的数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.theTGDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    theTGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTGIdentifier];
    
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"theTGTableViewCell" owner:self options:nil][0];
    }
    
    theTGModel *theModels = self.theTGDataArray[indexPath.row];
    cell.model = theModels;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _theTGTableView.rowHeight = 100;
    _theTGTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
