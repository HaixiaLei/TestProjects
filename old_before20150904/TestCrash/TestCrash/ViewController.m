//
//  ViewController.m
//  TestCrash
//
//  Created by Sywine on 4/23/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textF.enabled = YES;
    self.textF.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(tapped)];
    [self.view addGestureRecognizer:tap];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(hideMenuController) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}




-(void)hideMenuController{
    if ([UIMenuController sharedMenuController].menuVisible) {
        [[UIMenuController sharedMenuController] setMenuVisible:NO];}
}


-(void)tapped{
    [self.textF resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unknownSelector:(id)sender {
//    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
}

- (IBAction)keyPairIsNil:(id)sender {
//    [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
}

- (IBAction)arrayBeyondIndex:(id)sender {
//    [[NSArray array] objectAtIndex:1];
}

- (IBAction)memoryWarning:(id)sender {
//     [self performSelector:@selector(killMemory) withObject:nil];
}

- (void) killMemory
{
    for (int i = 0; i < 300; i ++)
    {
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        tmpLabel.layer.masksToBounds = YES;
        tmpLabel.layer.cornerRadius = 10;
        tmpLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:tmpLabel];
    }
}

@end
