//
//  ViewController.h
//  测试加速计与陀螺仪
//
//  Created by Sywine on 8/10/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *lblOriention;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CMMotionManager *motionManager;

- (IBAction)motionSwitchHandler:(id)sender;
@end

