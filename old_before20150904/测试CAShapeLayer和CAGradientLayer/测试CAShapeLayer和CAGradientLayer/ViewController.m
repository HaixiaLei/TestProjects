//
//  ViewController.m
//  测试CAShapeLayer和CAGradientLayer
//
//  Created by Sywine on 9/2/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"
#import "LayerView.h"

static NSUInteger tag = 0;
@interface ViewController (){
    NSArray *arr;
    BOOL isTransform;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = @[@"1,0,0",@"0,1,0",@"0,0,1",@"-1,0,0",@"0,-1,0",@"0,0,-1",@"1,1,0",@"0,1,1",@"1,0,1",@"-1,-1,0",@"0,-1,-1",@"-1,0,-1"];
    
    //变为圆形
    [self.myView setFrame:CGRectMake(5, 20, 80, 80)];
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:self.myView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(40, 40)];
    CAShapeLayer *shape = [[CAShapeLayer alloc]init];
    shape.frame = self.myView.bounds;
    shape.path = roundPath.CGPath;
    self.myView.layer.mask= shape;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 67)];
    [label setText:@"+"];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldSystemFontOfSize:70]];
    [self.myView addSubview:label];
    
    //加圆角以便识别
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.theLabel.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(50, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.theLabel.bounds;
    maskLayer.path = maskPath.CGPath;
    self.theLabel.layer.mask = maskLayer;
    
    //为label增加梯度颜色
    NSArray *colors = [NSArray arrayWithObjects:(id)[[[UIColor blackColor] colorWithAlphaComponent:1] CGColor],
                       (id)[[[UIColor yellowColor] colorWithAlphaComponent:1] CGColor],
                       (id)[[[UIColor blueColor] colorWithAlphaComponent:1] CGColor],
                       (id)[[UIColor clearColor] CGColor],
                       nil];
    NSArray *locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1],
     [NSNumber numberWithFloat:0.3],
     [NSNumber numberWithFloat:0.8],
     [NSNumber numberWithFloat:1.0],
     nil];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.locations = locations;
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 1);
    gradient.frame = self.theLabel.bounds;
    [self.theLabel.layer insertSublayer:gradient atIndex:0];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)movie:(id)sender {
    [self.myView setFrame:CGRectMake(5, 20, 80, 80)];
    self.myView.layer.anchorPoint = CGPointMake(0.5, 0.5); //设置锚点，默认锚点为(0.5,0.5)
    self.myView.transform = CGAffineTransformIdentity;

    CGPoint fromPoint = _myView.center;
    
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint toPoint = CGPointMake(280, 460);
    [movePath addQuadCurveToPoint:toPoint
                     controlPoint:CGPointMake(toPoint.x,fromPoint.y)];
    
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.removedOnCompletion = YES;
//    moveAnim.rotationMode = @"auto";//让图形沿着曲线的切线旋转
    moveAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:1 :0 :1 :1];
    moveAnim.removedOnCompletion = YES;
    
//    //缩放
//    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
//    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    //x，y轴缩小到0.1,Z 轴不变
//    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
//    scaleAnim.removedOnCompletion = YES;
//    
    //缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnim.toValue = [NSNumber numberWithFloat:0.1];
    scaleAnim.removedOnCompletion = YES;
    
        //旋转
//        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//        rotationAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-M_PI, 1, 1, 1)];
//        rotationAnimation.timingFunction = moveAnim.timingFunction;
//    rotationAnimation.repeatCount = 10;
//        rotationAnimation.removedOnCompletion = YES;
    
    //旋转
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2.7];
    // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.timingFunction = moveAnim.timingFunction;
    rotationAnimation.removedOnCompletion = YES;
    
    //关键帧，旋转，透明度组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.delegate = self;
    animGroup.animations = [NSArray arrayWithObjects:moveAnim,rotationAnimation, nil];
    animGroup.duration = 2.5;
    [_myView.layer addAnimation:animGroup forKey:nil];
    animGroup.removedOnCompletion = YES;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"accessibilityLabel=%@",anim.accessibilityLabel);
    if (isTransform) {
        //让变形保持原状
        isTransform = NO;
        NSArray *ar = [arr[tag] componentsSeparatedByString:@","];
        CATransform3D transform = CATransform3DMakeRotation(M_PI/3, ((NSString *)(ar[0])).floatValue, ((NSString *)(ar[1])).floatValue, ((NSString *)(ar[2])).floatValue);
        [self.theLabel.layer setTransform:transform];
        ++tag;if (tag>=11) tag = 0;
    }else{
        [self.myView setCenter:CGPointMake(280, 460)];
    }
}


- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}
- (void)setDefaultAnchorPointforView:(UIView *)view
{
    [self setAnchorPoint:CGPointMake(0.5f, 0.5f) forView:view];
}
- (IBAction)transform:(id)sender {
    for (id layer in self.theLabel.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    [self.theLabel.layer removeAllAnimations];
    [self.theLabel.layer setTransform:CATransform3DIdentity];
    isTransform = YES;
    
    NSLog(@"tag==%li,,value=%@",tag,arr[tag]);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotationAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    rotationAnimation.repeatCount = 1;
    rotationAnimation.duration = 1;
    rotationAnimation.removedOnCompletion = YES;
    rotationAnimation.delegate = self;
    rotationAnimation.accessibilityLabel = @"kkk";
    if (tag == 0) {
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 1, 0, 0)];
    }else if (tag == 1){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, 1, 0)];
    }else if (tag == 2){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, 0, 1)];
    }else if (tag == 3){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, -1, 0, 0)];
    }else if (tag == 4){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, -1, 0)];
    }else if (tag == 5){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, 0, -1)];
    }else if (tag == 6){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 1, 1, 0)];
    }else if (tag == 7){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, 1, 1)];
    }else if (tag == 8){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 1, 0, 1)];
    }else if (tag == 9){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, -1, -1, 0)];
    }else if (tag == 10){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, 0, -1, -1)];
    }else if (tag == 11){
        rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3, -1, 0, -1)];
    }
    
    
    [self.theLabel.layer addAnimation:rotationAnimation forKey:nil];
    
    
//    //或者直接用uiview来动画
//    [UIView animateWithDuration:1 animations:^{
//        [self.theLabel.layer setTransform:CATransform3DMakeRotation(M_PI/3, -1, -1, 0)];
//    }];
}

-(UIColor *)randomColorWithAlpha:(float)alpha{
    NSUInteger red = arc4random()%256;
    NSUInteger green = arc4random()%256;
    NSUInteger blue = arc4random()%256;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end

































