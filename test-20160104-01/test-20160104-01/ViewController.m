//
//  ViewController.m
//  test-20160104-01
//
//  Created by qingyun on 16/1/4.
//  Copyright © 2016年 qy15092. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UISlider *theSlider;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"红颜劫" withExtension:@"mp3"];
    
    AVAudioPlayer *thePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    _player = thePlayer;
    _player.delegate = self;
//    [_player prepareToPlay];
    
    [self loadDataView];
}

- (NSTimer *)timer {
    if (_timer) {
        return _timer;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateValue) userInfo:nil repeats:YES];
    return _timer;
}

- (void)updateValue {
    _theSlider.value = self.player.currentTime;
}

- (void)loadDataView {
    _theSlider.minimumValue = 0;
    _theSlider.maximumValue = self.player.duration;
    _theSlider.value = self.player.currentTime;
}

- (IBAction)theSliderValue:(UISlider *)sender {
    self.player.currentTime = _theSlider.value;
}

- (IBAction)theMusicStrat:(UIButton *)sender {
    if (!self.player.playing) {
        [self.player play];
        self.timer.fireDate = [NSDate distantPast];
    }
}

- (IBAction)thePause:(UIButton *)sender {
    if (self.player.playing) {
        [self.player pause];
        self.timer.fireDate = [NSDate distantFuture];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
