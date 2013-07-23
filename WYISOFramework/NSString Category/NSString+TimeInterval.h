//
//  NSString+TimeInterval.h
//  WYISOFramework
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeInterval)
// transform interval to a time string
NSString *stringFromInterval(NSTimeInterval timeInterval);
@end
