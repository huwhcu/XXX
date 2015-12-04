//
//  ViewController.m
//  test-20151204-02
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 QingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) NSArray *key;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

static NSString *

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadDictFromFile];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:i]
}

- (void)loadDictFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *array = _dict.allKeys;
    _key = [array sortedArrayUsingSelector:@selector(compare:)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _key.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = _key[section];
    NSArray *array = _dict[key];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#(NSString *)#>]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
