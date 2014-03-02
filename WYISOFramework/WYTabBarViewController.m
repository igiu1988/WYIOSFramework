//
//  WYTabBarViewController.m
//  WYISOFramework
//
//  Created by wangyang on 14-2-21.
//  Copyright (c) 2014年 wangyang. All rights reserved.
//

#import "WYTabBarViewController.h"

@interface WYTabBarViewController ()

@end

@implementation WYTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    UITabBarItem *item = self.tabBar.items[0];
    
    // 7.0使用这个会显示原生的图片
//    item.image = [[UIImage imageNamed:@"test"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 7.0 使用这个图片会显示成一个外轮括，蓝色
    // 6.0 使用这个图片会显示成一个外轮括，蓝色
//    item.image = [UIImage imageNamed:@"test"];
    
    // 6.0 使用这个会近似imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal这个
    [item setFinishedSelectedImage:[UIImage imageNamed:@"liveLearn"] withFinishedUnselectedImage:[UIImage imageNamed:@"liveLearn"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
