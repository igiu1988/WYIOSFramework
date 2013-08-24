//
//  WYMutitleTitleView.h
//  SjNews
//
//  Created by wangyang on 13-8-9.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^TitleButtonAction)(NSUInteger titleIndex);

@interface WYMutitleTitleView : UIScrollView

/**
 *	数组的内容是要显示的 button title，设置该属性后，button 将会被自动添加，详见其 set 方法
 */
@property (nonatomic, strong) NSArray *buttonTitleArray;

/**
 *	给该属性赋值会改变当前所选择的 title button
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

/**
 *	指定要 button 点击后要实现的 block 方法
 *
 *	@param	block	待实现的 block
 */
- (void)setButtonActionBlock:(TitleButtonAction)block;
@end
