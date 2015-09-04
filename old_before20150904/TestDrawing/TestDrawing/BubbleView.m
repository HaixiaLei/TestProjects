//
//  BubbleView.m
//  TestDrawing
//
//  Created by Sywine on 8/5/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "BubbleView.h"

#define bgColor [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.690]

@implementation BubbleView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc]initWithFrame:frame];
        [_label setTextColor:[UIColor whiteColor]];
        [_label setFont:[UIFont systemFontOfSize:12]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_label];
        self.color = bgColor;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setText:(NSString *)text{
    [_label setText:text];
    [_label sizeToFit];
    float w = _label.frame.size.width*1.1 +10;
    CGRect f = self.frame;
    f.size.width = w;
    [self setFrame:f];
    CGPoint p = CGPointMake(self.frame.size.width/2, self.frame.size.height/3);
    [_label setCenter:p];
    
//    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    
    //UIBezierPath画五角行
     /*
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    */
    
    //UIBezierPath画矩形
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
    //UIBezierPath画椭圆形
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 200)];
    //UIBezierPath画roundRect
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    //UIBezierPath画roundRect2
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) cornerRadius:10];
    //UIBezierPath画弧形
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:75 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    //UIBezierPath画二次贝塞尔曲线
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(20, 100)];
//    [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
    //UIBezierPath画三次贝塞尔曲线
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(20, 50)];
//    [aPath addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 10)];
//    
    
    
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:20 startAngle:0 endAngle:M_PI_4 clockwise:YES];
//    CGMutablePathRef cgPath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
//    aPath.CGPath = cgPath;
//    aPath.usesEvenOddFillRule = YES;
    
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//    UIColor *color = [UIColor greenColor];
//    [color set]; //设置线条颜色
//    [color setStroke];
//    [[UIColor purpleColor] setFill];
//    aPath.lineWidth = 3.0;
//    //    [aPath closePath];
//    //    [aPath stroke];//Draws line 根据坐标点连线
//    [aPath fill];//Draws 填充
    
    float startx = self.frame.size.width*3/10;
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/3) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(startx, startx)];
    [self.color set];
    [aPath fill];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point = CGPointMake(startx*7/8, self.frame.size.height*2/3);
    [path moveToPoint:point];
    CGPoint point1 = CGPointMake(startx-self.frame.size.height/3/3, self.frame.size.height*7/8);
    CGPoint control = CGPointMake(point.x, point1.y*8/9);
    [path addQuadCurveToPoint:point1 controlPoint:control];

    float y = point.x + self.frame.size.height/5;
    if (y-point.x>self.frame.size.width/4) {
        y = self.frame.size.width/4+point.x;
    }
    CGPoint p = CGPointMake(y, point.y);
    control = CGPointMake(p.x, point1.y*8/9);
    [path addQuadCurveToPoint:p controlPoint:control];
    [self.color set];
    [path fill];

    path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    [path addLineToPoint:p];
    [self.color set];
    [path stroke];
}

@end

































