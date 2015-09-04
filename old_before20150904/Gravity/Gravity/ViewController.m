//
//  ViewController.m
//  Gravity
//
//  Created by Sywine on 12/23/14.
//  Copyright (c) 2014 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravity;
    UICollisionBehavior *collision;
    
    NSTimer *timer;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    UIView *vvvv = [[UIView alloc]initWithFrame:CGRectMake(120, 398, 4, 4)];
    vvvv.backgroundColor = [UIColor redColor];
    [self.view addSubview:vvvv];
    
    UIView *ttt = [[UIView alloc]initWithFrame:CGRectMake(298, 498, 4, 4)];
    ttt.backgroundColor = [UIColor redColor];
    [self.view addSubview:ttt];
    
    
    
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    gravity = [[UIGravityBehavior alloc]initWithItems:@[view]];
    [animator addBehavior:gravity];
    
    collision = [[UICollisionBehavior alloc]initWithItems:@[view]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [collision addBoundaryWithIdentifier:@"xxx" fromPoint:CGPointMake(122, 400) toPoint:CGPointMake(122, 400)];
    [animator addBehavior:collision];
    
    timer = [[NSTimer alloc]initWithFireDate:[NSDate date] interval:3 target:self selector:@selector(fireNow) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)fireNow{
    static float x = 80;
    x += 10;
    if (x > 280) {
        x = 80;
    }
    
    UIView *vvvvvv = [[UIView alloc]initWithFrame:CGRectMake(x, 0, 70, 70)];
    [vvvvvv setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:vvvvvv];
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    gravity = [[UIGravityBehavior alloc]initWithItems:@[vvvvvv]];
    [gravity setAngle:1.4 magnitude:1.2];
    [animator addBehavior:gravity];
    
    collision = [[UICollisionBehavior alloc]initWithItems:@[vvvvvv]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [collision addBoundaryWithIdentifier:@"xxx" fromPoint:CGPointMake(x+10, 400) toPoint:CGPointMake(x+130, 500)];
    [animator addBehavior:collision];
}





































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
