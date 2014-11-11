//
//  UIView+LineWithAutolayout.h
//  ZhengXing
//
//  Created by wangyang on 11/6/14.
//  Copyright (c) 2014 Wanmei Creative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LineWithAutolayout)
/**
 *  单纯给一个 view 添加一个分隔线。最底部分隔线或者最底部分隔线
 */
- (void)addTopLine;
- (void)addBottomLine;

/**
 *  单纯给一个 view 添加一个分隔线。最底部分隔线或者最底部分隔线。
 *  @note 但是 line 是被加到了方法的 receive view（self） 上。详见方法内部
 *
 *  @param view 需要有分隔线的 view. line 会依据这个 view 添加约束
 */
- (void)addTopLineForView:(UIView *)view;
- (void)addBottomLineForView:(UIView *)view;

/**
 *  给 view 添加底部的水平分隔线。通常用于 cell
 *
 *  @param left     左约束
 *  @param right    右约束
 */
- (void)addSeperatorWithLeft:(float)left right:(float)right;

/**
 *  给 view 添加水平分隔线，并为分隔线指定约束情况
 *
 *  @param left  左约束
 *  @param right 右约束
 *  @param top   上约束
 */
- (void)addHorizenalSeperatorWithLeft:(float)left right:(float)right top:(float)top;
- (void)addVerticalSeperatorWithLeft:(float)left top:(float)top bottom:(float)bottom;
@end
