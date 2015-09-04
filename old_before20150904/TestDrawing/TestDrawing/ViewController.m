//
//  ViewController.m
//  TestDrawing
//
//  Created by Sywine on 8/5/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    BubbleView *view = [[BubbleView alloc]initWithFrame:CGRectMake(0, 20, 20, 27)];
    BubbleView *view = [[BubbleView alloc]initWithFrame:CGRectMake(50, 20, 120, 22)];
//
//    [view.label setTextColor:[UIColor greenColor]];
//    [view.label setFont:[UIFont boldSystemFontOfSize:30]];
    [view setText:@"1"];
    [self.view addSubview:view];
    
    
    UILabel *lx = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 150, 30)];
    [lx setText:@"xxx"];
    lx.backgroundColor = [UIColor redColor];
    [self.view addSubview:lx];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
