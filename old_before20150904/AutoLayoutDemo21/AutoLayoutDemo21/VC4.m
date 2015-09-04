//
//  VC4.m
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/9.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "VC4.h"
#import "TestView.h"
#import "VerticalView.h"

#define H_PADDING 60.0
#define V_PADDING 10.0

@interface VC4 (){
    TestView *testView;
    VerticalView *verticalView;
}

@end

@implementation VC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //从storyboard中提取view
//    vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TestVc"];
    
    testView = [[[NSBundle mainBundle] loadNibNamed:@"TestView" owner:self options:nil]lastObject];
    [testView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:testView];
    
    verticalView = [[[NSBundle mainBundle] loadNibNamed:@"VerticalView" owner:self options:nil]lastObject];
    [verticalView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:verticalView];
    
    [self addContraints];
}

-(void)addContraints{
    
    //水平等间距按钮
    UIView *bottomBtn = self.bottomButton0;
    NSDictionary *dict1 = NSDictionaryOfVariableBindings(testView,verticalView,bottomBtn);
    NSDictionary *metrics = @{@"vPadding":@70,@"hPadding":@H_PADDING,@"vvPadding":@V_PADDING};
    
    NSString *vfl0 = @"|-hPadding-[testView]-hPadding-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl0
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl1 = @"V:|-vPadding-[testView(60)]-vvPadding-[verticalView]-vvPadding-[bottomBtn]";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl1
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    NSString *vfl2 = @"[verticalView(120)]";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl2
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:dict1]];
    

    //让verticalView水平居中
    NSLayoutConstraint *c0 = [NSLayoutConstraint constraintWithItem:verticalView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0];
    [self.view addConstraint:c0];
}

//这是委托方法
-(void)updateViewConstraints{
    
    [self autoArrangeViewWithLeftConstraints:@[testView.b0L,
                                               testView.b1L,
                                               testView.b2L]
                            widthConstraints:@[testView.b0w,
                                               testView.b1w,
                                               testView.b2w]
                                      margin:H_PADDING
                                    vertical:NO];
    
    [self autoArrangeViewWithLeftConstraints:@[verticalView.b0v,
                                               verticalView.b1v,
                                               verticalView.b2v]
                            widthConstraints:@[verticalView.b0h,
                                               verticalView.b1h,
                                               verticalView.b2h]
                                      margin:V_PADDING
                                    vertical:YES];
    
    [self autoArrangeViewWithLeftConstraints:@[self.B1H,
                                               self.B2H,
                                               self.B3H]
                            widthConstraints:@[self.b2W,
                                               self.b2W,
                                               self.b2W]
                                      margin:0
                                    vertical:NO];
    
    [super updateViewConstraints];
}

//margin是整个view到边界的距离
-(void)autoArrangeViewWithLeftConstraints:(NSArray *)leftArray widthConstraints:(NSArray *)widthArray margin:(float)margin vertical:(BOOL)vertical{
    if (leftArray.count != widthArray.count) {
        NSLog(@"%@ Error,values passed in do not fit!",NSStringFromSelector(_cmd));
        return;
    }
    float totalWidth = 0;
    float gap = 0;
    for (int i = 0; i < leftArray.count; i++) {
        NSLayoutConstraint *width = widthArray[i];
        if (vertical) {
            NSLog(@"width==%f,,",width.constant);
        }
        totalWidth += width.constant;
    }
    gap = (self.view.frame.size.width- 2*margin - totalWidth)/(leftArray.count + 1);
    if (vertical) {
        NSLog(@"total_height=%f,view=%f",totalWidth,self.view.frame.size.height - 70 - 60 - 2*V_PADDING - self.bottomButton0.frame.size.height - self.bottomButton0Space.constant);
        
        
        gap = (self.view.frame.size.height - 70 - 60 - 2*V_PADDING - self.bottomButton0.frame.size.height - self.bottomButton0Space.constant - totalWidth)/(leftArray.count + 1);
    }
    static float leftB = 0;
    for (int i = 0; i < leftArray.count; i++) {
        NSLayoutConstraint *left = leftArray[i];
        NSLayoutConstraint *width = widthArray[i];
        left.constant = leftB + gap;
        if (vertical) {
            NSLog(@"left.constant=%.2f,,gap=%f",left.constant,gap);
        }
        leftB += width.constant + gap;
    }
    leftB = 0;
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
