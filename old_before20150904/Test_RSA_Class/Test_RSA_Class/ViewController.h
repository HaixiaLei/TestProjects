//
//  ViewController.h
//  Test_RSA_Class
//
//  Created by Sywine on 4/14/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;
@property (weak, nonatomic) IBOutlet UITextView *decryptTextView;

- (IBAction)encryptAction:(id)sender;
- (IBAction)decryptAction:(id)sender;
@end

