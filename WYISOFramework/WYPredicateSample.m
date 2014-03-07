//
//  WYPredicateSample.m
//  WYISOFramework
//
//  Created by wangyang on 14-3-7.
//  Copyright (c) 2014年 wangyang. All rights reserved.
//

#import "WYPredicateSample.h"

@implementation WYPredicateSample
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL flag = [emailTest evaluateWithObject:email];
    return flag;
}

+(BOOL)isValidatePhoneNumber:(NSString *)number
{
    /*
     已经开放了多少个号码段，国家号码段分配如下：
     
     移动：134、135、136、137、138、139、150、151、157(TD)、158、159、187、188
     
     联通：130、131、132、152、155、156、185、186
     
     电信：133、153、180、189、（1349卫通）
     
     NSString *str = @"^((13[0-9])|(15[^4,\\D])|(18[0,2,5-9]))\\d{8}$" ;
     */
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,2,5-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL flag = [phoneTest evaluateWithObject:number];
    return flag;
}
@end
