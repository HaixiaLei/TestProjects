//
//  VC2.h
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/5.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC2 : UIViewController

- (IBAction)adjustLabelLengh:(id)sender;
- (IBAction)adjustSubviewHeight:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UILabel *label0;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSubViewHeight;
@end
