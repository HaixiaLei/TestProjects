//
//  ViewController.m
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/2.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIButton *naviRightBtn;
    UIView *touchedView;
    BOOL isTransfering;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //在navigationbar上加个按钮
    naviRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [naviRightBtn setTitle:@"Transfer" forState:UIControlStateNormal];
    [naviRightBtn setFrame:CGRectMake(30, 3, 60, 35)];
    [naviRightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [naviRightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [naviRightBtn addTarget:self action:@selector(naviRightItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *naviRightItem = [[UIBarButtonItem alloc]initWithCustomView:naviRightBtn];
    self.navigationItem.rightBarButtonItem = naviRightItem;
}

-(void)naviRightItemPressed:(UIButton *)btn{
    if (isTransfering) {
        isTransfering = NO;
        [naviRightBtn setTitle:@"Transfer" forState:UIControlStateNormal];
        [naviRightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.coverView.hidden = YES;
    }else{
        isTransfering = YES;
        [naviRightBtn setTitle:@"Done" forState:UIControlStateNormal];
        [naviRightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.coverView.hidden = NO;
    }
}

//实现触摸移动
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setConstraintsEnable:YES];
    UIColor *aaa;
    [aaa set];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"...");
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setConstraintsEnable:NO];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setConstraintsEnable:NO];
}

-(void)setConstraintsEnable:(BOOL)enable{
    [self.btn1 setTranslatesAutoresizingMaskIntoConstraints:enable];
    [self.btn2 setTranslatesAutoresizingMaskIntoConstraints:enable];
    [self.btn3 setTranslatesAutoresizingMaskIntoConstraints:enable];
    [self.btn4 setTranslatesAutoresizingMaskIntoConstraints:enable];
}

@end
