//
//  ViewController.m
//  FrameAndBounds
//
//  Created by 蓝布鲁 on 2017/9/4.
//  Copyright © 2017年 蓝布鲁. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    
    
    // 变换bounds.origin
    [self changeBoundsOrigin];
    
    
    // 变换bounds.size
//    [self changeBoundsSize];
    
    
    // 变换frame.size
//    [self changeFrameSize];
    
    
    // 旋转变换
//    [self transformView];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"scrollView bounds:%@",NSStringFromCGRect(self.scrollView.bounds));
}

// 变换bounds.origin
- (void)changeBoundsOrigin {
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
//    blueView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.scrollView addSubview:blueView];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.center = CGPointMake(blueView.bounds.size.width/2, blueView.bounds.size.height/2);
    [blueView addSubview:redView];
    // 改变父View的bounds
    [UIView animateWithDuration:3 animations:^{
        CGRect bounds = blueView.bounds;
        bounds.origin = CGPointMake(-30, -30);
        blueView.bounds = bounds;
    } completion:^(BOOL finished) {
        NSLog(@"%@",NSStringFromCGRect(blueView.bounds));
    }];
}

// 变换bounds.size
- (void)changeBoundsSize {
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.scrollView addSubview:blueView];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.center = CGPointMake(blueView.bounds.size.width/2, blueView.bounds.size.height/2);
    [blueView addSubview:redView];
    // 改变父View的bounds
    NSLog(@"blueView begin:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGPoint(blueView.center));
    NSLog(@"redView begin:%@ %@",NSStringFromCGRect(redView.frame),NSStringFromCGPoint(redView.center));
    [UIView animateWithDuration:3 animations:^{
        CGRect bounds = blueView.bounds;
        bounds.size = CGSizeMake(250, 250);
        blueView.bounds = bounds;
    } completion:^(BOOL finished) {
        NSLog(@"blueView end:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGPoint(blueView.center));
        NSLog(@"redView end:%@ %@",NSStringFromCGRect(redView.frame),NSStringFromCGPoint(redView.center));
    }];
}

// 变换frame.size
- (void)changeFrameSize {
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.scrollView addSubview:blueView];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.center = CGPointMake(blueView.bounds.size.width/2, blueView.bounds.size.height/2);
    [blueView addSubview:redView];
    // 改变父View的bounds
    NSLog(@"blueView begin:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGPoint(blueView.center));
    NSLog(@"redView begin:%@ %@",NSStringFromCGRect(redView.frame),NSStringFromCGPoint(redView.center));
    [UIView animateWithDuration:3 animations:^{
        CGRect frame = blueView.frame;
        frame.size = CGSizeMake(250, 250);
        blueView.frame = frame;
    } completion:^(BOOL finished) {
        NSLog(@"blueView end:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGPoint(blueView.center));
        NSLog(@"redView end:%@ %@",NSStringFromCGRect(redView.frame),NSStringFromCGPoint(redView.center));
    }];
}

// 旋转变换
- (void)transformView {
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.scrollView addSubview:blueView];

    // 改变父View的bounds
    NSLog(@"blueView begin:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGRect(blueView.bounds));
    [UIView transitionWithView:blueView duration:3 options:0 animations:^{
        blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:^(BOOL finished) {
        NSLog(@"blueView begin:%@ %@",NSStringFromCGRect(blueView.frame),NSStringFromCGRect(blueView.bounds));
    }];
}




@end
