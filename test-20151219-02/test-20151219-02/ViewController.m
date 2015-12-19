//
//  ViewController.m
//  test-20151219-02
//
//  Created by qingyun on 15/12/19.
//  Copyright © 2015年 qy15092. All rights reserved.
//

#import "ViewController.h"

#define kURL @"http://www.itoobz.com/uploads/allimg/1212/19-121211163517.jpg"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UIButton *resumeBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *theProgress;
@property (weak, nonatomic) IBOutlet UIImageView *theImgView;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downLoadTask;
@property (nonatomic, strong) NSData *resumeData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 创建session
- (NSURLSession *)session {
    if (_session == nil) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    }
    return _session;
}

#pragma mark - 下载按钮
- (IBAction)downLoadStart:(UIButton *)sender {
    self.downLoadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:kURL]];
    [self.downLoadTask resume];
    
    _downLoadBtn.enabled = NO;
    _theProgress.hidden = NO;
    _cancleBtn.hidden = NO;
}

#pragma mark - 取消(中断)按钮
- (IBAction)cancleDownLoad:(UIButton *)sender {
    if (self.downLoadTask == nil) {
        return;
    }
    
    _cancleBtn.hidden = YES;
    [self.downLoadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
        self.downLoadTask = nil;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resumeBtn.hidden = NO;
        });
    }];
}

#pragma mark - 继续按钮
- (IBAction)resumeDownLoad:(UIButton *)sender {
    if (self.resumeData == nil) {
        return;
    }
    
    _resumeBtn.hidden = YES;
    self.downLoadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    [self.downLoadTask resume];
    _cancleBtn.hidden = NO;
}

- (IBAction)theRemove:(UIButton *)sender {
    _theImgView.image = nil;
}

#pragma mark - session delegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _theImgView.image = image;
        _theProgress.hidden = YES;
        _cancleBtn.hidden = YES;
        _resumeBtn.hidden = YES;
        _downLoadBtn.enabled = YES;
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _theProgress.progress = progress;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
