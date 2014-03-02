//
//  WYAlgorithmsCompare.m
//  WYISOFramework
//
//  Created by wangyang on 14-2-17.
//  Copyright (c) 2014年 wangyang. All rights reserved.
//

#import "WYAlgorithmsCompare.h"

@implementation WYAlgorithmsCompare
#import <mach/mach_time.h>  // for mach_absolute_time() and friends

#define LOOPAGE 100000000

CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
    
} // BNRTimeBlock

+ (void)fun
{
    CGFloat time;
    
    NSString *thing1 = @"hi";
    NSString *thing2 = @"hello there";
    
    time = BNRTimeBlock(^{
        for (long int i = 0; i < LOOPAGE; i++) {
            [thing1 isEqual: thing2];
        }
    });
    printf ("isEqual: time: %f\n", time);
    
    time = BNRTimeBlock(^{
        for (long int i = 0; i < LOOPAGE; i++) {
            [thing1 isEqualToString: thing2];
        }
    });
    printf ("isEqualToString: time: %f\n", time);
}

@end

