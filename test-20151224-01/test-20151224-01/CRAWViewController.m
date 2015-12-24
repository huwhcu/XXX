//
//  CRAWViewController.m
//  test-20151224-01
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "CRAWViewController.h"

#define path @"test.txt"

@interface CRAWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfContent;
@property (nonatomic, strong) NSString *filePath;

@end

@implementation CRAWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadDataFromLocal];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (NSString *)filePath {
    NSString *libarPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    
    _filePath = [libarPath stringByAppendingPathComponent:path];
    
    return _filePath;
}

- (void)loadDataFromLocal {
    FILE *fp = fopen([self.filePath UTF8String], "r");
    if (fp == NULL) {
        NSLog(@"读取失败");
        return;
    }
    
    char buffer[1024] = {0};
    // 将文件指针偏移至指定位置(尾部)
    fseek(fp, 0, SEEK_END);
    // 计算文件长度
    ftell(fp);
    long len = ftell(fp);
    // 将文件指针移动至文件头
    rewind(fp);
    
    size_t count = fread(buffer, len, 1, fp);
    if (count > 0) {
        NSLog(@"读取成功");
    }
    fclose(fp);
    
    // 将读取的内容赋给tf
    _tfContent.text = [NSString stringWithUTF8String:buffer];
}

- (BOOL)saveData {
    FILE *fp = fopen([self.filePath UTF8String], "w+");
    if (fp == NULL) {
        NSLog(@"打开失败");
        return NO;
    }
    
    NSString *content = _tfContent.text;
    int leng = (int)content.length;
    
    size_t count = fwrite([content UTF8String], leng, 1, fp);
    if (count > 0) {
        NSLog(@"写入成功");
    }
    
    fclose(fp);
    
    return YES;
}

- (IBAction)touchSave:(id)sender {
    [self saveData];
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
