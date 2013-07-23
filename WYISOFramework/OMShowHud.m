//
//  OMShowHud.m
//  OrderMeal
//
//  Created by wangyang on 13-5-29.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "OMShowHud.h"
#import "SVProgressHUD.h"
#define HUDVIEW_COLOR           [UIColor colorWithRed:79.0f/255.0 green:6.0f/255.0 blue:6.0f/255.0 alpha:0.8]
@implementation OMShowHud
+ (void)showHudMessage:(NSString *)message type:(OMShowHudType)type inView:(UIView *)view
{
    [[SVProgressHUD appearance] setHudBackgroundColor:HUDVIEW_COLOR];
    if (type == OMShowHudTypeGradient){
        [SVProgressHUD showWithStatus:message maskType:OMShowHudTypeGradient];
    }else if (type == OMShowHudTypeStatus){
        [SVProgressHUD showWithStatus:message];
    }
}

+ (void)showHudMessage:(NSString *)message type:(OMShowHudType)type duration:(float)duration inView:(UIView *)view
{
    [[SVProgressHUD appearance] setHudBackgroundColor:HUDVIEW_COLOR];
    if (type == OMShowHudTypeSuccess) {
        [SVProgressHUD showSuccessWithStatus:message];
    }else if (type == OMShowHudTypeError){
        [SVProgressHUD showErrorWithStatus:message];
    }
    
//    double delayInSeconds = duration;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [SVProgressHUD dismiss];
//    });
}

+ (void)showProgressHudMessage:(NSString *)message progress:(float)progress inView:(UIView *)view
{
    [[SVProgressHUD appearance] setHudBackgroundColor:HUDVIEW_COLOR];
    [SVProgressHUD showProgress:progress status:message maskType:OMShowHudTypeGradient];
}


+ (void)dismiss
{
    [SVProgressHUD dismiss];
}
@end
