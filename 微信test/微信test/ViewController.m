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

@property (nonatomic, strong) NSMutableArray *theTGData;
@property (weak, nonatomic) IBOutlet UITableView *theTGTableView;

@end

@implementation ViewController

static NSString *theTGIdentifier = @"TGCell";

#pragma mark - TG的模型转换

- (NSMutableArray *)theTGDataArray
{
    if (_theTGData == nil) {
        NSString *pathTG = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *theArray = [NSArray arrayWithContentsOfFile:pathTG];
        
        _theTGData = [NSMutableArray array];
        for (NSDictionary *dict in theArray) {
            theTGModel *model = [theTGModel theTGModelForDict:dict];
            [_theTGData addObject:model];
        }
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

#pragma mark - 表头设置

- (void)addSubViewsForTable:(UITableView *)tableView{
    UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    scrollerView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 100);
    scrollerView.pagingEnabled = YES;
    scrollerView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imgView.image = [UIImage imageNamed:imgName];
        [scrollerView addSubview:imgView];
    }
    tableView.tableHeaderView = scrollerView;
}

#pragma mark - 编辑：删除

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_theTGData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert){
        
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    theTGModel *model = (theTGModel *)_theTGData[fromIndexPath.row];
    [_theTGData removeObjectAtIndex:fromIndexPath.row];
    [_theTGData insertObject:model atIndex:toIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (IBAction)editItemClick:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"完成";
        [_theTGTableView setEditing:YES animated:YES];
    } else {
        sender.title = @"编辑";
        [_theTGTableView setEditing:NO animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _theTGTableView.rowHeight = 100;
    _theTGTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self addSubViewsForTable:_theTGTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
