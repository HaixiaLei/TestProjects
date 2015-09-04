//
//  Cell1Label.m
//  测试加速计与陀螺仪
//
//  Created by Sywine on 8/11/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "Cell1Label.h"

@implementation Cell1Label

-(void)setText:(NSString *)text{
    [super setText:text];
    float v = text.floatValue;
    if (fabs(v)>=0.3) {
        self.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    }else{
        self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    
}

@end
