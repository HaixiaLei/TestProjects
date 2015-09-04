//
//  ViewController.m
//  TestMotionEffict
//
//  Created by Sywine on 8/12/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //水平偏移值
    UIInterpolatingMotionEffect * xEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xEffect.minimumRelativeValue =  [NSNumber numberWithFloat:-40.0];
    xEffect.maximumRelativeValue = [NSNumber numberWithFloat:40.0];
    [self.view addMotionEffect:xEffect];
    
//    垂直偏移值
    UIInterpolatingMotionEffect * yEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"frame.origin.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yEffect.minimumRelativeValue =  [NSNumber numberWithFloat:-40.0];
    yEffect.maximumRelativeValue = [NSNumber numberWithFloat:40.0];
    [self.view addMotionEffect:yEffect];
    
    
    //VC切换
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
