//
//  OCRawViewController.m
//  test-20151224-02
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "OCRawViewController.h"

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
        
        
    }
}

- (BOOL)saveData {
    return YES;
}

- (void)loadDataFromLocal {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
