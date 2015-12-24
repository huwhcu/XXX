//
//  ViewController.m
//  test-20151224-01
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.title=@"数据持久化方法";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _array = @[@"CRAWViewController"];
    
    UITableView *theTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    theTableView.dataSource = self;
    theTableView.delegate = self;
    [self.view addSubview:theTableView];
}

#pragma mark - TabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = _array[indexPath.row];
    UIViewController * controller = [[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
