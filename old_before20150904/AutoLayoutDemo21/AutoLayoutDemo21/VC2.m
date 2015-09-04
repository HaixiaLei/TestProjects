//
//  VC2.m
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/5.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "VC2.h"

@interface VC2 ()

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)adjustLabelLengh:(id)sender {
    static int i = 0;
    if (i == 0) {
        [self.label0 setText:@"LabelLabelLabelLabelL"];
    }else if (i == 1){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabel等等"];
    }else if (i == 2){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabelLabel山山水水"];
    }else if (i == 3){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabeLabelLabelLabeLabelLabelLabelLabelLabelLabelLabel"];
    }else if (i == 4){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeLabelLabelLabeelLabel"];
    }
    i ++;
    if (i > 4) {
        i = 0;
    }
}

- (IBAction)adjustSubviewHeight:(id)sender {
    static int i = 0;
    if (i == 0) {
        self.constraintSubViewHeight.constant = 80;
    }else if (i == 1){
        self.constraintSubViewHeight.constant = 160;
    }else if (i == 2){
        self.constraintSubViewHeight.constant = 240;
    }else if (i == 3){
        self.constraintSubViewHeight.constant = 320;
    }else if (i == 4){
        self.constraintSubViewHeight.constant = 400;
    }
    i ++;
    if (i > 4) {
        i = 0;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
