//
//  ViewController.h
//  Test_controlll
//
//  Created by Sywine on 15/1/22.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablevieww;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

