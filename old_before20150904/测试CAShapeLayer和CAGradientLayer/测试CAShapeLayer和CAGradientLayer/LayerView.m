//
//  LayerView.m
//  测试CAShapeLayer和CAGradientLayer
//
//  Created by Sywine on 9/2/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "LayerView.h"

@implementation LayerView

-(void)setup{
    CGPoint arcCenter = CGPointMake(CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds));
    CGFloat radius = CGRectGetMidX(self.bounds) - 10;
    
    self.circlePath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                     radius:radius
                                                 startAngle:M_PI 
                                                   endAngle:-M_PI 
                                                  clockwise:NO];
    
    self.backgroundLayer = [CAShapeLayer layer];
    self.backgroundLayer.path = self.circlePath.CGPath;
    self.backgroundLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    self.backgroundLayer.fillColor = [[UIColor clearColor] CGColor];
    self.backgroundLayer.lineWidth = self.strokeWidth;
    self.backgroundLayer.strokeEnd = 0.5f;
    [self.layer addSublayer:self.backgroundLayer];
    
    
    
}

- (void)addNewLayer
{
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.path = self.circlePath.CGPath;
    progressLayer.strokeColor = [[self randomColor] CGColor];
    progressLayer.fillColor = [[UIColor clearColor] CGColor];
    progressLayer.lineWidth = self.strokeWidth;
    progressLayer.strokeEnd = 0.f;
    
    [self.layer addSublayer:progressLayer];
    [self.progressLayers addObject:progressLayer];
    
    self.currentProgressLayer = progressLayer;
}

-(UIColor *)randomColor{
    NSInteger red = arc4random()%256;
    NSInteger green = arc4random()%256;
    NSInteger blue = arc4random()%256;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)updateAnimations
{
    CGFloat duration = self.duration * (1.f - [[self.progressLayers firstObject] strokeEnd]);
    CGFloat strokeEndFinal = 1.f;
    
    for (CAShapeLayer *progressLayer in self.progressLayers)
    {
        CABasicAnimation *strokeEndAnimation = nil;
        strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.duration = duration;
        strokeEndAnimation.fromValue = @(progressLayer.strokeEnd);
        strokeEndAnimation.toValue = @(strokeEndFinal);
        strokeEndAnimation.autoreverses = NO;
        strokeEndAnimation.repeatCount = 0.f;
        strokeEndAnimation.fillMode = kCAFillModeForwards;
        strokeEndAnimation.removedOnCompletion = NO;
        strokeEndAnimation.delegate = self;
        [progressLayer addAnimation:strokeEndAnimation forKey:@"strokeEndAnimation"];
        
        strokeEndFinal -= (progressLayer.strokeEnd - progressLayer.strokeStart);
        
        if (progressLayer != self.currentProgressLayer)
        {
            CABasicAnimation *strokeStartAnimation = nil;
            strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
            strokeStartAnimation.duration = duration;
            strokeStartAnimation.fromValue = @(progressLayer.strokeStart);
            strokeStartAnimation.toValue = @(strokeEndFinal);
            strokeStartAnimation.autoreverses = NO;
            strokeStartAnimation.repeatCount = 0.f;
            strokeStartAnimation.fillMode = kCAFillModeForwards;
            strokeStartAnimation.removedOnCompletion = NO;
            [progressLayer addAnimation:strokeStartAnimation forKey:@"strokeStartAnimation"];
        }
    }
    CABasicAnimation *backgroundLayerAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    backgroundLayerAnimation.duration = duration;
    backgroundLayerAnimation.fromValue = @(self.backgroundLayer.strokeStart);
    backgroundLayerAnimation.toValue = @(1.f);
    backgroundLayerAnimation.autoreverses = NO;
    backgroundLayerAnimation.repeatCount = 0.f;
    backgroundLayerAnimation.fillMode = kCAFillModeForwards;
    backgroundLayerAnimation.removedOnCompletion = NO;
    backgroundLayerAnimation.delegate = self;
    [self.backgroundLayer addAnimation:backgroundLayerAnimation forKey:@"strokeStartAnimation"];
}

@end
