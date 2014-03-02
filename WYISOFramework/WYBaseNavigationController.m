//
//  WYBaseNavigationController.m
//  OrderMeal
//
//  Created by wangyang on 13-6-8.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "WYBaseNavigationController.h"
#import "DeviceCommon.h"
#import "UIImage+PureColorImage.h"
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
    
    if (!iOS7OrLater) {
        // 设置navigation 背景
        [self.navigationBar setTintColor:[UIColor colorWithWhite:.89 alpha:1]];
        
        // 全局设置 backButton 的图片，至少要有这两句话，要不然至少会在ios5上不生效
        // back button的大小(@1x情况下)应该是50x30
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 50, 0, 0);
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"1_navigation_back"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"1_navigation_back"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
        
    }else{
        
        // 在 ios7里，如果要改变导航栏的主体颜色，使用该方法，这只影响导航栏主体颜色，与标题及后退按键的颜色无关
        // self.navigationBar.barTintColor = [UIColor redColor];
        
        // 设置navigation 背景。改这个背景，在 ios7里，默认的后退按键，标题都会跟着改颜色。在 ios6里还不了解情况
        [self.navigationBar setTintColor:[UIColor colorWithWhite:.5 alpha:1]];
        
        // 如果想要用自己的图片替换V型，可以设置图片的backIndicatorImage和backIndicatorTransitionMaskImage。如下代码所示：
//        [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
//        [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];

    }
    
    // 隐藏系统的 back button 标题，
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -44*2) forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -44*2) forBarMetrics:UIBarMetricsLandscapePhone];
    
    
    
    // 给navigation添加一个阴影
    //    UIImageView *shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navigation_Shadow"]];
    //    shadow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    //    shadow.frame = CGRectMake(0, 44, UI_SCREEN_WIDTH, 13);
    //    [self.navigationBar addSubview:shadow];
    
    
    // 自定义导航栏上 title 字体，不包括后退按键上的 title 字体
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSShadowAttributeName: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
                                                           NSShadowAttributeName: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                                           NSForegroundColorAttributeName: [UIColor colorWithRed:83.0/255 green:79.0/255 blue:78.0/255 alpha:1.0],
                                                           NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:22.0]}];
    
    // 自定义后退按键上 title 字体，不包括导航样栏 titile 字体
    //    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    //    [attributes setValue:[UIColor colorWithRed:(163.0f/255.0f) green:(0.0f) blue:(0.0f) alpha:1.0f] forKey:UITextAttributeTextColor];
    //    [attributes setValue:[UIColor clearColor] forKey:UITextAttributeTextShadowColor];
    //    //    [attributes setValue:[UIFont fontWithName:@"Helvetica" size:15] forKey:UITextAttributeFont];
    //    [attributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0.0, 0.0)] forKey:UITextAttributeTextShadowOffset];
    //    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
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
