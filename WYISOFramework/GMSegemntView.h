//
//  GMSegemntControl.h
//  GMSegemntControl
//
//  Created by wangyang on 11/2/14.
//  Copyright (c) 2014 gengmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GMSegemntViewValueChangeBlock)(NSUInteger index);

/**
 可以在 IB 里添加一个 view，继承该类。也可以使用 init 方法来实例化
 
 */
@interface GMSegemntView : UIView

/**
 *  设置该背景颜色时会将 self.backgroundColor 设置为该颜色，SegmentControl的背景图片会设置为透明，详见 set 方法
 *  默认为背景白色。
 */
@property (nonatomic, copy) UIColor *backgroundColor;

// 默认显示分割符
@property (nonatomic, assign) BOOL showDividImage;
@property (nonatomic, strong) UIImage *dividImage;

@property (nonatomic, strong, readonly) UISegmentedControl *segmentControl;
@property (nonatomic, strong, readonly) UIView   *selectedView;


- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  设置方法
 *
 *  @param items            标题 string 数组. NSString
 *  @param valueChangeBlock segementValueChange时触发的回调
 *
 *  @return SegmentView 实例
 */
- (void)setItems:(NSArray *)items segmentValueChange:(GMSegemntViewValueChangeBlock)valueChangeBlock;


/**
 *  添加 Badge Manage
 *
 *  @param index badge 位置
 */
- (void)addBadgeImageAtIndex:(NSUInteger)index;

/**
 *  删除 Badge Manage
 *
 *  @param index badge 位置
 */
- (void)removeBadgeImageAtIndex:(NSUInteger)index;

@end
