//
//  LayerView.h
//  测试CAShapeLayer和CAGradientLayer
//
//  Created by Sywine on 9/2/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayerView : UIView

@property (nonatomic, assign)float strokeWidth;
@property (nonatomic, assign)float duration;


@property (nonatomic, strong)UIBezierPath *circlePath;
@property (nonatomic, strong)NSMutableArray *progressLayers;
@property (nonatomic, strong)CAShapeLayer *currentProgressLayer;
@property (nonatomic, strong)CAShapeLayer *backgroundLayer;

-(void)setup;
@end
