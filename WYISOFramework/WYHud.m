//
//  WYHud.m
//  OrderMeal
//
//  Created by wangyang on 13-5-29.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "WYHud.h"
#import "SVProgressHUD.h"

@implementation WYHud
/*WYHudTypeOnlyText = 1,          // 只显示文字信息，不显示额外内容
 WYHudTypeSuccess,               // 显示文字内容及一个成功的标志
 WYHudTypeError,                 // 显示错误及相应错误标志
 WYHudTypeWindow,                // 会阻塞用户操作，进行等待
 WYHudTypeLoading                // 正在加载
 */
+ (void)hudMessage:(NSString *)message type:(WYHudType)type
{
    if (type == WYHudTypeOnlyText) {
        
        
        [SVProgressHUD showOnlyString:message];
    }else if (type == WYHudTypeSuccess){
        
    }
    
    
//    double delayInSeconds = duration;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [SVProgressHUD dismiss];
//    });
}

+ (void)ProgressHudMessage:(NSString *)message progress:(float)progress inView:(UIView *)view
{

}


+ (void)dismiss
{
    
}
@end
