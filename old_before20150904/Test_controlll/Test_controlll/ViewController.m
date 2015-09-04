//
//  ViewController.m
//  Test_controlll
//
//  Created by Sywine on 15/1/22.
//  Copyright (c) 2015年 Sywine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.tintColor = [UIColor redColor];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tablevieww addSubview:self.refreshControl];
    
    [self.refreshControl addTarget:self action:@selector(tttttt) forControlEvents:UIControlEventValueChanged];
    [[self.refreshControl.subviews objectAtIndex:0] setFrame:CGRectMake(20, 0, 20, 30)];
}

-(void)tttttt{
    [self performSelector:@selector(rrr) withObject:nil afterDelay:2];
}

-(void)rrr{
    [self.refreshControl endRefreshing   ];
    [self.tablevieww reloadData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"INDENTIFIER";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}






























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
