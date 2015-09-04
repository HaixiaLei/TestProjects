//
//  AppDelegate.m
//  TestCrash
//
//  Created by Sywine on 4/23/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic , copy) NSString *aaa;

@end


@interface NSString (aa)
-(void)setaa;
@property (nonatomic ,copy) NSString *bb;
@end

@implementation NSString (aa)

-(void)setaa{
    NSLog(@"xxxxxx");
}

-(void)setBb:(NSString *)bb{
    
}

-(NSString *)bb{
    return @"bbbbbb";
}
@end


void uncaughtExceptionHandler(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    NSLog(@"%@", exceptionInfo);
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    [tmpArr insertObject:reason atIndex:0];
    
    //保存到本地  --  当然你可以在下次启动的时候，上传这个log
    [exceptionInfo writeToFile:[NSString stringWithFormat:@"%@/Documents/error.log",NSHomeDirectory()]  atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSString *str = [NSString stringWithFormat:@"%@/Documents/error.log",NSHomeDirectory()];
    NSLog(@"str=%@",str);
    
    
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    
    self.aaa = @"";
    [self.aaa setaa];
    [self.aaa setBb:@"cc"];
    NSLog(@"bbb=%@",self.aaa.bb);
    return YES;
}


@end
