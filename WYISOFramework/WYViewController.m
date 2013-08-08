//
//  WYViewController.m
//  WYISOFramework
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYViewController.h"
#import "UIViewController+ObserverKeyboard.h"

@interface WYViewController ()

@end

@implementation WYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self observeKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard Show NOtification

@end
