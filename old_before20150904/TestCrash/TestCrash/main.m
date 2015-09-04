//
//  main.m
//  TestCrash
//
//  Created by Sywine on 4/23/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        int foo[5] = {1,2,3,4,5};
        int *p = foo;
        for (int i = 0; i < 5; i++) {
            printf("===>%i,%i,%p\n",i[p],*p,p);
        }
        
        
        
        
        
        
        
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
