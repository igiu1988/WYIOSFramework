//
//  WYBaseNavigationController.m
//  OrderMeal
//
//  Created by wangyang on 13-6-8.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "WYBaseNavigationController.h"
#import "DeviceCommon.h"

@interface WYBaseNavigationController ()

@end

@implementation WYBaseNavigationController

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
	
    // 设置navigation 背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation_Bg"] forBarMetrics:UIBarMetricsDefault];
    
    
    // 全局设置 backButton 的图片，至少要有这两句话，要不然至少会在ios5上不生效
    // back button的大小无所谓，关键是如何针对不同图片使用不同UIEdgeInsets, UIEdgeInsets的说明自己看文档
    // 对于当前的sample使用的后退图片效果是希望是所有后退按键都是50x30大小，比如只是一个后退的箭头。那么UIEdgeInsets就设置成如下样式
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 50, 0, 0);
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"Back_Button"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"Back_Button"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    
    // 隐藏系统的 back button 标题，
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 44*2) forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 44*2) forBarMetrics:UIBarMetricsLandscapePhone];
    
    // 给navigation添加一个阴影
    UIImageView *shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navigation_Shadow"]];
    shadow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    shadow.frame = CGRectMake(0, 44, UI_SCREEN_WIDTH, 13);
    [self.navigationBar addSubview:shadow];
    
    // 自定义title 字体
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:237.0/255.0 green:200.0/255.0 blue:86.0/255.0 alpha:1.0], UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"HelveticaNeue-Bold" size:25.0], UITextAttributeFont,
      nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 在ios6.0(不包括6.0)以下版本，走该方法，测试时发现如果在ios5上如果不override该方法，UI布局就会不正常
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0)
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
@end
