//
//  WYScrollView.m
//  WYISOFramework
//
//  Created by wangyang on 13-8-8.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYScrollView.h"

@implementation WYScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/**
 *	如下方式重写该方法后，对于一个左右滑动的 scroll view，如果 content offset 是0时，用户向右滑，scroll view 不会响应该手势，该手势会向下一层的 responder 传递。
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if ([gestureRecognizer isMemberOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")]) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint velocity = [pan velocityInView:self];
        if (velocity.x > 0 && self.contentOffset.x == 0) {
            return NO;
        }
    }
    
    return YES;
}


@end
