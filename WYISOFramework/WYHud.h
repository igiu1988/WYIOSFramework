//
//  WYHud.h
//  OrderMeal
//
//  Created by wangyang on 13-5-29.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	拿到不同的项目时，可以扩展type 内容，以适应不同项目
 */
typedef enum _WYHudType
{
    WYHudTypeOnlyText = 1,          // 只显示文字信息，不显示额外内容
    WYHudTypeSuccess,               // 显示文字内容及一个成功的标志
    WYHudTypeError,                 // 显示错误及相应错误标志
    WYHudTypeWindow,                // 会阻塞用户操作，进行等待
    WYHudTypeLoading                // 正在加载
}WYHudType;


#define DEFAULT_DURATION        0.25
#define INFINITE_DURATION       0       // 用于等待
@interface WYHud : NSObject

/**
    调用该方法显示hud提示信息，并指定hud显示的时间
    @param message 要显示的提示信息
    @param type hud提示的类型
 */
+ (void)hudMessage:(NSString *)message type:(WYHudType)type;

+ (void)ProgressHudMessage:(NSString *)message progress:(float)progress inView:(UIView *)view;

+ (void)dismiss;

@end
