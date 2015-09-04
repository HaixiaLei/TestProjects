//
//  ViewController.h
//  测试CAShapeLayer和CAGradientLayer
//
//  Created by Sywine on 9/2/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign)UIBezierPath *circlePath;
@property (nonatomic, assign)float strokeWidth;

@property (weak, nonatomic) IBOutlet UIView *myView;

- (IBAction)movie:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *theLabel;

- (IBAction)transform:(id)sender;
@end

