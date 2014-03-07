//
//  WYPredicateSample.h
//  WYISOFramework
//
//  Created by wangyang on 14-3-7.
//  Copyright (c) 2014年 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYPredicateSample : NSObject
+(BOOL)isValidateEmail:(NSString *)email;
+(BOOL)isValidatePhoneNumber:(NSString *)number;

@end
