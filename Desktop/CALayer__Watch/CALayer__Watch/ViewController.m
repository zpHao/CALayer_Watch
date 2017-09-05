//
//  ViewController.m
//  CALayer__Watch
//
//  Created by glw on 2017/9/4.
//  Copyright © 2017年 haozp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *secondHandView;
@property (nonatomic, strong) UIView *minuteHandView;
@property (nonatomic, strong) UIView *hourHandView;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *dialLayer= [[CALayer alloc] init];
    dialLayer.bounds = CGRectMake(0, 0, 150, 150);
    
    dialLayer.position = self.view.center;
    
    dialLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bgImage"].CGImage);
//    dialLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    [self.view.layer addSublayer:dialLayer];
    
    
    //    设置秒针
    UIView *secondHandView = [[UIView alloc]init];
    secondHandView.backgroundColor = [UIColor redColor];
    secondHandView.bounds = CGRectMake(0, 0, 1, 50);
    secondHandView.center = self.view.center;
    
//    //    修改锚点
    secondHandView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:secondHandView];
//    self.secondHandView = secondHandView;
//    
//    
//    
//    
//    //设置分针
//    UIView *minuteHandView = [[UIView alloc]init];
//    minuteHandView.backgroundColor = [UIColor blackColor];
//    minuteHandView.bounds = CGRectMake(0, 0, 2, 35);
//    minuteHandView.center = self.view.center;
//    
//    minuteHandView.layer.anchorPoint = CGPointMake(0.5, 1);
//    [self.view addSubview:minuteHandView];
//    self.minuteHandView = minuteHandView;
//    
//    //设置时针
//    UIView *hourHandView = [[UIView alloc]init];
//    hourHandView.backgroundColor = [UIColor blackColor];
//    hourHandView.bounds = CGRectMake(0, 0, 3, 25);
//    hourHandView.center = self.view.center;
//    
//    hourHandView.layer.anchorPoint = CGPointMake(0.5, 1);
//    [self.view addSubview:hourHandView];
//    self.hourHandView = hourHandView;
//
//    
//    
//    //    创建CADisplayLink
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(clockRunning)];
//    //    将创建的CADisplayLink加入到主线程中
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}
- (void)clockRunning{
    //获取本地时区
    NSTimeZone *tZone = [NSTimeZone localTimeZone];
    
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //设置日历的时区
    [calendar setTimeZone:tZone];
    //取出当前的时分秒
    NSDateComponents *currentTime = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitTimeZone fromDate:currentDate];
    
    CGFloat angle = (M_PI * 2 / 60) * currentTime.second;
    
    self.secondHandView.transform = CGAffineTransformMakeRotation(angle);
    
    CGFloat minuteAngle = (M_PI * 2 / 60) * currentTime.minute;
    self.minuteHandView.transform = CGAffineTransformMakeRotation(minuteAngle);

    CGFloat hourAngle = (M_PI * 2 / 12) * currentTime.hour;
    self.hourHandView.transform = CGAffineTransformMakeRotation(hourAngle);
    
}
- (void)dealloc{
    self.link.paused = YES;
    [self.link invalidate];
    self.link = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
