//
//  ViewController.m
//  testDecimalMultiply
//
//  Created by Sywine on 12/18/14.
//  Copyright (c) 2014 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%.2lf",[@"123456789012345.333" doubleValue]);
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    

    
}



//NSDecimailNumber进行金额乘法运算
-(NSString *)multiplyDecimalNumberByAarray:(NSArray *)DNArr

{
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithString:@"1"];
    for (int i = 0; i < DNArr.count; i++) {
        NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:DNArr[i]];
        result = [result decimalNumberByMultiplyingBy:multiplicandNumber];
    }
    
    return [result stringValue] ;
}

//NSDecimailNumber进行金额除法运算
-(NSString *)divideDecimalNumber:(NSString *)divisorStr By:(NSString *)dividendStr
{
    NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithString:divisorStr];
    NSDecimalNumber *dividend = [NSDecimalNumber decimalNumberWithString:dividendStr];
    
    NSDecimalNumber *result = [divisor decimalNumberByDividingBy:dividend];
    return [result stringValue];
}

@end
