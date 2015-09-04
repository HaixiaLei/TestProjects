//
//  VC3.m
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/5.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "VC3.h"

@interface VC3 (){
    UIView        *anchorView_;
    UIScrollView  *scrollView_;
    UIView        *contentView_;
    UILabel       *label_;
    UIImageView   *imageView_;
    UIButton      *btnBack_;
    UIButton      *btnAdjust_;
    UILabel       *instructionLabel;
}

@end

@implementation VC3

#pragma mark - view init
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"使用代码";//标题
    [self addViews];//添加控件
    [self setConstraints];//设置约束
    [self test];
}

#pragma mark - test
-(void)test{
    [label_ setText:@"00"];
    [imageView_ setImage:[UIImage imageNamed:@"44"]];
}

#pragma mark - UI affairs
//把空间添加到界面上
-(void)addViews{
    anchorView_ = [UIView new];//锚点
    
    scrollView_ = [UIScrollView new];//背景
    scrollView_.backgroundColor = [UIColor lightGrayColor];
    
    contentView_ = [UIView new];
    contentView_.backgroundColor = [UIColor blueColor];
    contentView_.clipsToBounds = YES;
    
    label_ = [UILabel new];//文字
    label_.backgroundColor = [UIColor purpleColor];
    label_.numberOfLines = 999;
    label_.preferredMaxLayoutWidth = 250;//不是从xib初始化的多行label必须设置这个属性
    label_.lineBreakMode = NSLineBreakByCharWrapping;
    
    imageView_ = [UIImageView new];//图片
    imageView_.backgroundColor = [UIColor whiteColor];
    imageView_.contentMode = UIViewContentModeScaleAspectFit;
    
    btnBack_ = [UIButton new];//返回
    [btnBack_ addTarget:self action:@selector(btnBackPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btnBack_ setTitle:@"Back" forState:UIControlStateNormal];
    [btnBack_ setBackgroundColor:[UIColor redColor]];
    
    btnAdjust_ = [UIButton new];//切换图片和文字
    [btnAdjust_ addTarget:self action:@selector(btnAdjustPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btnAdjust_ setTitle:@"Switch" forState:UIControlStateNormal];
    [btnAdjust_ setBackgroundColor:[UIColor redColor]];
    
    instructionLabel = [UILabel new];//标题
    [instructionLabel setText:@"Scrollview Without IB"];
    [instructionLabel setTextAlignment:NSTextAlignmentCenter];
    [instructionLabel setBackgroundColor:[UIColor yellowColor]];
    
    //使用autoLayout须先禁用AutoresizingMask
    [anchorView_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [scrollView_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [contentView_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imageView_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnBack_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnAdjust_ setTranslatesAutoresizingMaskIntoConstraints:NO];
    [instructionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:anchorView_];
    [self.view addSubview:scrollView_];
    [scrollView_ addSubview:contentView_];
    [contentView_ addSubview:label_];
    [contentView_ addSubview:imageView_];
    [self.view addSubview:btnBack_];
    [self.view addSubview:btnAdjust_];
    [self.view addSubview:instructionLabel];
}

-(void)setConstraints{
    NSDictionary *dict1 = NSDictionaryOfVariableBindings(anchorView_, contentView_, scrollView_, label_, imageView_, btnBack_, btnAdjust_,instructionLabel);
    NSDictionary *metrics = @{@"viewPadding":@10,@"btnPadding":@15.0,@"scrollBottomPadding":@80,@"topPadding":@50,@"titlePadding":@0,@"titlePaddingTop":@20};
    
    //btnBack_
    NSString *vfl0 = @"|-btnPadding-[btnBack_(80)]"; //btnBack_距离屏幕左方btnPadding的距离,宽80
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl0
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl1 = @"V:[btnBack_(50)]-btnPadding-|"; //btnBack_距离屏幕下方btnPadding的距离,高50
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl1
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //btnAdjust_
    NSString *vfl2 = @"[btnAdjust_(btnBack_)]-btnPadding-|"; //btnAdjust_距离屏幕右方btnPadding的距离,宽与btnBack_相等
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl2
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl3 = @"V:[btnAdjust_(btnBack_)]-btnPadding-|"; //btnAdjust_距离屏幕下方btnPadding的距离,高与btnBack_相等
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl3
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //scrollView_
    NSString *vfl4 = @"|-viewPadding-[scrollView_]-viewPadding-|"; //scrollView_距离左右各viewPadding的距离
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl4
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl5 = @"V:|-topPadding-[scrollView_]-scrollBottomPadding-|"; //scrollView_距离上viewPadding的距离，距离下scrollBottomPadding的距离
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl5
                                                                      options:0
                               
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //contentView_
    NSString *vfl6 = @"|-viewPadding-[contentView_]-viewPadding-|"; //contentView_距离左右各viewPadding的距离
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl6
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl7 = @"V:|-viewPadding-[contentView_]-viewPadding-|"; //contentView_距离左右各viewPadding的距离
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl7
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl8 = @"[contentView_(anchorView_)]"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl8
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl9 = @"V:[contentView_(anchorView_)]"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl9
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //label_
    NSString *vfl12 = @"|-viewPadding-[label_]-viewPadding-|"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl12
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl13 = @"V:|-viewPadding-[label_]-viewPadding-[imageView_]"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl13
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //imageView_
    NSString *vfl14 = @"[imageView_]->=viewPadding-|"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl14
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
//    NSString *vfl15 = @"[anchorView_(250)]"; //
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl15
//                                                                      options:0
//                                                                      metrics:metrics
//                                                                        views:dict1]];
    
    //title
    NSString *vfl16 = @"|-titlePadding-[instructionLabel]-titlePadding-|"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl16
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    NSString *vfl17 = @"V:|-titlePaddingTop-[instructionLabel(20)]"; //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl17
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    
    //anchorView_
    NSLayoutConstraint *c0 = [NSLayoutConstraint constraintWithItem:anchorView_
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:-40];
    [self.view addConstraint:c0];
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:anchorView_
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:contentView_
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:0.0];
    [self.view addConstraint:c1];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:anchorView_
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:contentView_
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0.0];
    [self.view addConstraint:c2];
    NSLayoutConstraint *c3 = [NSLayoutConstraint constraintWithItem:anchorView_
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:imageView_
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:10.0];
    [self.view addConstraint:c3];
}

#pragma mark - Button events
-(void)btnBackPressed:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)btnAdjustPressed:(UIButton *)btn{
    static int i = 0;
    if (i == 0) {
        [label_ setText:@"dismissViewControllerAnimadismissViewControllerAnima"];
        [imageView_ setImage:[UIImage imageNamed:@"00.png"]];
    }else if (i == 1){
        [label_ setText:@"dismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnima"];
        [imageView_ setImage:[UIImage imageNamed:@"11.png"]];
    }else if (i == 2){
        [label_ setText:@"dismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnima"];
        [imageView_ setImage:[UIImage imageNamed:@"22.png"]];
    }else if (i == 3){
        [label_ setText:@"dismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnima"];
        [imageView_ setImage:[UIImage imageNamed:@"33.png"]];
    }else if (i == 4){
        [label_ setText:@"dismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnimadismissViewControllerAnima"];
        [imageView_ setImage:[UIImage imageNamed:@"44.png"]];
    }
    
    if (++i > 4) {
        i = 0;
    }
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
