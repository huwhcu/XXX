//
//  OCRawViewController.m
//  test-20151224-02
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "OCRawViewController.h"

#define fileName @"test.txt"

@interface OCRawViewController ()

@property (weak, nonatomic) IBOutlet UITextField *theTextField;
@property (nonatomic, strong) NSString *filePath;

@end

@implementation OCRawViewController

- (IBAction)theBtn:(id)sender {
    
}

- (NSString *)filePath {
    if (_filePath == nil) {
        NSString *direcPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
        // 创建文件夹
            // 获取文件管理器对象
            NSFileManager *fileManager = [NSFileManager defaultManager];
            // 创建文件夹
            NSString *directoryPath = [direcPath stringByAppendingPathComponent:@"test"];
            NSError *error;
            if ([fileManager createDirectoryAtPath:direcPath withIntermediateDirectories:YES attributes:0 error:&error]) {
                NSLog(@"ERROR:%@", error);
                return nil;
            }
        // 创建文件
            // 合并文件路径
            NSString *fPath = [directoryPath stringByAppendingPathExtension:fileName];
            if (![fileManager fileExistsAtPath:fPath]) {
                if (![fileManager createFileAtPath:fPath contents:nil attributes:0]) {
                    NSLog(@"文件创建失败");
                    return nil;
                }
                _filePath = fPath;
            }else {
            _filePath = fPath;
        }
    }
    return _filePath;
}

- (BOOL)saveData {
    NSError *error;
    if (![_theTextField.text writeToFile:self.filePath atomically:YES encoding:NSUTF8StringEncoding error:&error]) {
        NSLog(@"失败");
        return NO;
    }
    return YES;
}

- (void)loadDataFromLocal {
    // 读取本地文件，转化为string
    NSStringEncoding encoding;
    NSString *content = [NSString stringWithContentsOfFile:self.filePath usedEncoding:&encoding error:nil];
    NSLog(@"the encoding:%lu", (unsigned long)encoding);
    // 更新TextField
    _theTextField.text = content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 读取本地数据
    [self loadDataFromLocal];
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
