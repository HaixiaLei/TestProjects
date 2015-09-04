//
//  ViewController.m
//  Test_RSA_Class
//
//  Created by Sywine on 4/14/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.inputTextView.layer.borderWidth = 0.5f;
    self.outputTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.outputTextView.layer.borderWidth = 0.5f;
    self.decryptTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.decryptTextView.layer.borderWidth = 0.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)encryptAction:(id)sender {
    RSAEncrypt *rsa = [[RSAEncrypt alloc] init];
    if (rsa != nil) {
        NSString *string = [rsa encryptToString:self.inputTextView.text];
        self.outputTextView.text = string;
        self.outputTextView.textColor = [UIColor colorWithRed:0.000 green:0.790 blue:0.005 alpha:1.000];
        NSLog(@"String:%@\nLong:%ld",string,string.length);
    } else {
        self.outputTextView.text = @"加密失败！";
        self.outputTextView.textColor = [UIColor redColor];
    }
    
    NSLog(@"\npass1:%@\npass2:%@\n",[rsa encryptToString:@"123"],[rsa encryptToString:@"456"]);
    
    
}

- (IBAction)decryptAction:(id)sender {
}
@end
