//
//  VC1.m
//  AutoLayoutDemo21
//
//  Created by Sywine on 15/2/2.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "VC1.h"

@interface VC1 ()

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    static int i = 0;
    if (i == 0) {
        [self.label0 setText:@"LabelLabelLabel"];
        [self.image0 setImage:[UIImage imageNamed:@"11.png"]];
    }else if (i == 1){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabelLabel"];
        [self.image0 setImage:[UIImage imageNamed:@"22.png"]];
    }else if (i == 2){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"];
        [self.image0 setImage:[UIImage imageNamed:@"33.png"]];
    }else if (i == 3){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"];
        [self.image0 setImage:[UIImage imageNamed:@"44.png"]];
    }else if (i == 4){
        [self.label0 setText:@"LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"];
        [self.image0 setImage:[UIImage imageNamed:@"00.png"]];
    }
    i ++;
    if (i > 4) {
        i = 0;
    }
}

@end
