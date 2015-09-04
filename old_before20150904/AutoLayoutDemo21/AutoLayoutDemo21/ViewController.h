//
//  ViewController.h
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/2.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//


/* 说明：
 共有VC1、VC2、VC3、VC4四个页面，各页面如下：
 VC1：实现一个灰色背景，背景内有可变长度的label一个，size可变的imageVie一个，点击按钮，切换label长度和imageView图片，实现autolayout效果
 VC2 和 VC3分别是用IB和代码实现一个scrollview的autolayout
 VC4: 实现横向和纵向的按钮间间隔的等距效果
 
 由于是用autolayout实现，使得改变屏幕朝向可用
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIView *coverView;

@end

