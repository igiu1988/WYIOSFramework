//
//  UIResponder+FirstResponder.m
//  WYISOFramework
//
//  Created by wangyang on 13-8-6.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "UIResponder+FirstResponder.h"

static __weak id currentFirstResponder;

@implementation UIResponder (FirstResponder)

+(id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

-(void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}

@end