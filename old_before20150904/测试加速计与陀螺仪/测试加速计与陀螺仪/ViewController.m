//
//  ViewController.m
//  测试加速计与陀螺仪
//
//  Created by Sywine on 8/10/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"
#import "Cell1.h"

@interface ViewController (){
    NSArray *arrAttributes;
    NSMutableArray *arrValues;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrAttributes = @[@"左右摆动（yaw）:",@"俯仰（pitch）:",@"滚动（roll）:",
                      @"userAcceleration.x:",@"userAcceleration.y:",@"userAcceleration.z:",
                      @"gravity.x:",@"gravity.y:",@"gravity.z:",
                      @"rotation.x:",@"rotation.y:",@"rotation.z:"];
    arrValues = [[NSMutableArray alloc]initWithArray:@[@"0.00",@"0.00",@"0.00",
                                                       @"0.00",@"0.00",@"0.00",
                                                       @"0.00",@"0.00",@"0.00",
                                                       @"0.00",@"0.00",@"0.00"]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell1" bundle:nil] forCellReuseIdentifier:@"cell1"];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification"object:nil];
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 1.0f/10.0f; //1秒10次
}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    NSLog(@"当前朝向枚举数字值：%d",orientation);
    
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            self.lblOriention.text = @"Portrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.lblOriention.text = @"Portrait Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.lblOriention.text = @"Landscape Left";
            break;
        case UIDeviceOrientationLandscapeRight:
            self.lblOriention.text = @"Landscape Right";
            break;
        case UIDeviceOrientationFaceUp:
            self.lblOriention.text = @"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            self.lblOriention.text = @"Face Down";
            break;
        default:
            self.lblOriention.text = @"Unknown";
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (NSInteger)arrAttributes.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.lblL.text = arrAttributes[indexPath.row];
    cell.lblR.text = arrValues[indexPath.row];
    return cell;
}

- (IBAction)motionSwitchHandler:(id)sender {
    UISwitch *motionSwitch = (UISwitch *)sender;
    if(motionSwitch.on)
    {
        [self controlHardware];
    }
    else
    {
        [self.motionManager stopDeviceMotionUpdates];
    }
}

- (void)controlHardware
{
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        //Acceleration
        arrValues[3] = [NSString stringWithFormat:@"%.5f",motion.userAcceleration.x];
        arrValues[4] = [NSString stringWithFormat:@"%.5f",motion.userAcceleration.y];
        arrValues[5] = [NSString stringWithFormat:@"%.5f",motion.userAcceleration.z];
        //Gravity
        arrValues[6] = [NSString stringWithFormat:@"%.5f",motion.gravity.x];
        arrValues[7] = [NSString stringWithFormat:@"%.5f",motion.gravity.y];
        arrValues[8] = [NSString stringWithFormat:@"%.5f",motion.gravity.z];
        //yaw,pitch,roll
        arrValues[0] = [NSString stringWithFormat:@"%.5f",motion.attitude.yaw];
        arrValues[1] = [NSString stringWithFormat:@"%.5f",motion.attitude.pitch];
        arrValues[2] = [NSString stringWithFormat:@"%.5f",motion.attitude.roll];
        //Gyroscope's rotationRate(CMRotationRate)
        arrValues[9] = [NSString stringWithFormat:@"%.5f",motion.rotationRate.x];
        arrValues[10] = [NSString stringWithFormat:@"%.5f",motion.rotationRate.y];
        arrValues[11] = [NSString stringWithFormat:@"%.5f",motion.rotationRate.z];
        [self.tableView reloadData];
        
        
//        double rotation = atan2(motion.gravity.x, motion.gravity.y) - M_PI;
//        self.view.transform = CGAffineTransformMakeRotation(rotation);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
