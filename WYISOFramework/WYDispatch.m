//
//  WYDispatch.m
//  WYISOFramework
//
//  Created by wangyang on 13-11-8.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYDispatch.h"

@implementation WYDispatch
- (void)trialDispatchGroup
{
    // 01 ~ 20
    // http://bizhi.zhuoku.com/wall/200701/0125/dongwu/dongwu20.jpg
    
    dispatch_group_t group = dispatch_group_create();
    
    // 可以这样将操作添加到group中，dispatch_group_enter与dispatch_group_leave必须成对出现
    for (int i = 1; i<20; i++) {
        
        // 使用dispatch_group_enter和dispatch_group_leave可以将someCode添加到多个group中
        
        // 标识一个操作开始，
        dispatch_group_enter(group);
        // dispatch_group_enter(anotherGroup);
        
        // TODO: someCode here
        
        // 标识一个操作结束
        dispatch_group_leave(group);
        // dispatch_group_leave(anotherGroup);
    }
    
    // 也可以这样将操作添加到group中
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // TODO: someCode
    });
    
    
    // 这句话是等待这个group完成，这样会阻断主线程的
    // dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
    // 这句话是在这个group完成时，异步调用一个block
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"下载完成");
    });
    
    
    // 此时干点别个
    dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        NSLog(@"%zu", index);
    });
    
    dispatch_group_
    
}
@end
