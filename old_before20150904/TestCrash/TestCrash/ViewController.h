//
//  ViewController.h
//  TestCrash
//
//  Created by Sywine on 4/23/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>


- (IBAction)unknownSelector:(id)sender;
- (IBAction)keyPairIsNil:(id)sender;
- (IBAction)arrayBeyondIndex:(id)sender;
- (IBAction)memoryWarning:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITextField *textF;


@end

