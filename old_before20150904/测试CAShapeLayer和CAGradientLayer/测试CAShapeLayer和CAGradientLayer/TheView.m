//
//  TheView.m
//  测试CAShapeLayer和CAGradientLayer
//
//  Created by Sywine on 9/3/15.
//  Copyright (c) 2015 Sywine. All rights reserved.CGRectMake(5, 20, 80, 80)
//[self.myView setFrame:CGRectMake(5, 20, 80, 80)];
//CGPoint fromPoint = _myView.center;
//
////路径曲线
//UIBezierPath *movePath = [UIBezierPath bezierPath];
//[movePath moveToPoint:fromPoint];
//CGPoint toPoint = CGPointMake(280, 460);
//

#import "TheView.h"

@implementation TheView

-(void)drawRect:(CGRect)rect{
    CGRect rect1 = CGRectMake(5, 20, 80, 80);
    CGPoint fromPoint = CGPointMake(47,100);
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint toPoint = CGPointMake(240,460);
    [movePath addQuadCurveToPoint:toPoint
                     controlPoint:CGPointMake(toPoint.x,fromPoint.y)];
    [movePath addLineToPoint:CGPointMake(280-40, 500)];
    [movePath addLineToPoint:CGPointMake(5, 500)];
    [movePath addLineToPoint:CGPointMake(5, CGRectGetMidY(rect1)+CGRectGetHeight(rect1)/2)];
    [movePath closePath];
    
    movePath.lineCapStyle = kCGLineCapRound;
    movePath.lineWidth = 10.0f;
    movePath.lineJoinStyle = kCGLineJoinRound;
    [[UIColor greenColor] set];
    [movePath fill];
    
    
    NSString *string = @"斜 坡";
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(-1, -3);
    shadow.shadowBlurRadius = 1;
    shadow.shadowColor = [UIColor yellowColor];
    [string drawAtPoint:CGPointMake(80, 260) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:50],NSForegroundColorAttributeName:[UIColor blackColor],NSShadowAttributeName:shadow,NSExpansionAttributeName:@-0.3,NSObliquenessAttributeName:@-0.8}];
    
}

@end
