//
//  ViewController.m
//  ProphetDemo
//
//  Created by luoqihsneg on 2016/11/23.
//  Copyright © 2016年 com.luoqihsneg. All rights reserved.
//

#import "BizOneController.h"

#import <AnnotationKit/LifeCycleAnnnotation.h>
#import <AnnotationKit/AKRouteAnnotaion.h>
@interface BizOneController (test)

@end
@implementation BizOneController (test)

@When(AppLaunched,BizOneController,doLaunchedCategory)
+ (void)doLaunchedCategory:(NSNotification *)note
{
    NSLog(@"%@",note);
}

@end

@interface BizOneController ()
@property (nonatomic,strong) UIButton *jumpProfile;
@end

@RequestMapping(BizOneController, "prophet://demo/biz1/")
@implementation BizOneController

@When(AppLaunched,BizOneController,doLaunched)
+ (void)doLaunched:(NSNotification *)note
{
    NSLog(@"%@",note);
}

@When(AppEnterForeground,BizOneController,doEnterForeground)
+ (void)doEnterForeground:(NSNotification *)note
{
    NSLog(@"%@",note);
}

@When(AppEnterBackground,BizOneController,doEnterBackground)
+ (void)doEnterBackground:(NSNotification *)note
{
    NSLog(@"%@",note);
}

@When(AppResignActive,BizOneController,doResignActive)
+ (void)doResignActive:(NSNotification *)note
{
    NSLog(@"%@",note);
}

@When(AppBecameActive,BizOneController,doBecameActive)
+ (void)doBecameActive:(NSNotification *)note
{
    NSLog(@"%@",note);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Biz1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.jumpProfile];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jumpProfile
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jumpProfile
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jumpProfile
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1 constant:100]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jumpProfile
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1 constant:30]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter 
- (UIButton *)jumpProfile
{
    if (!_jumpProfile) {
        _jumpProfile = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpProfile.translatesAutoresizingMaskIntoConstraints = NO;
        [_jumpProfile setTitle:@"To biz2" forState:UIControlStateNormal];
        [_jumpProfile setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _jumpProfile.layer.borderColor = [UIColor blueColor].CGColor;
        _jumpProfile.layer.borderWidth = 1;
        [_jumpProfile addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpProfile;
}

#pragma mark - action
- (void)onClick:(id)sender
{
    UIViewController *vc = [[HHRouter shared]matchController:@"prophet://demo/biz2/"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end