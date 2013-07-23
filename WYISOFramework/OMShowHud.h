//
//  OMShowHud.h
//  OrderMeal
//
//  Created by wangyang on 13-5-29.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum _KOMShowHudType
{
    OMShowHudTypeStatus = 0,       // 只显示文字信息，不显示额外内容
    OMShowHudTypeSuccess,           // 显示文字内容及一个成功的标志
    OMShowHudTypeError,
    OMShowHudTypeGradient,           // 会阻塞用户操作，进行等待
    OMShowHudTypeProgress
}OMShowHudType;

@interface OMShowHud : NSObject
/**
	调用该方法显示hud提示信息，并在固定时间后消失
	@param message 要显示的提示信息
	@param type hud提示的类型
    @param view hud将要显示所在的view
 */
+ (void)showHudMessage:(NSString *)message type:(OMShowHudType)type inView:(UIView *)view;

/**
    调用该方法显示hud提示信息，并指定hud显示的时间
    @param message 要显示的提示信息
    @param type hud提示的类型
    @param view hud将要显示所在的view
	@param duration 要显示的时间
 */
+ (void)showHudMessage:(NSString *)message type:(OMShowHudType)type duration:(float)duration inView:(UIView *)view;

+ (void)showProgressHudMessage:(NSString *)message progress:(float)progress inView:(UIView *)view;

+ (void)dismiss;

@end
