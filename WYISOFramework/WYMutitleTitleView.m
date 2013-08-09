//
//  WYMutitleTitleView.m
//  SjNews
//
//  Created by wangyang on 13-8-9.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import "WYMutitleTitleView.h"
#import <QuartzCore/QuartzCore.h>


#define BUTTON_TAG_MASK     100
#define BUTTON_MARGIN       5.0
#define BUTTON_Y            6.0
#define BUTTON_HEIGHT       20.0

@interface WYMutitleTitleView ()
{
    UIView *titleHighlightBackgroundView;
    TitleButtonAction buttonActionBlock;
}

@end


@implementation WYMutitleTitleView

#pragma mark - Init from Interface Builder
- (void)awakeFromNib
{
    [self addTitleHightlighBackgroundView];
}

#pragma mark - 公有方法
/**
 *	如果从外部设置该属性：
 *      1. 取消先前 button selected 状态；
 *      2. 设置相应 button selected；
 *      3. 改变一下该属性值;
 *      4. 调用动画就可以
 *  如果是点击 button：详见 buttonClick: 方法
 *
 *	@param	selectedIndex	将要选择的 button index
 */
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    // 取消先前 button 的状态
    UIButton *previousbutton = (UIButton *)[self viewWithTag:_selectedIndex + BUTTON_TAG_MASK];
    previousbutton.selected = NO;
    
    // 处理新的 button
    UIButton *currentButton = (UIButton *)[self viewWithTag:selectedIndex + BUTTON_TAG_MASK];
    currentButton.selected = YES;
    
    // 改变属性值
    _selectedIndex = selectedIndex;

    // 调用动画
    [self animateSelectedButtonBackgroundAtIndex:_selectedIndex animate:YES];
}

/**
 *	清除原来的 button，并依据 title array 重新添加 button
 *
 *	@param	buttonTitleArray	待显示的 title array
 */
- (void)setButtonTitleArray:(NSArray *)buttonTitleArray
{
    if (buttonTitleArray == nil || buttonTitleArray.count <= 0) {
        return;
    }
    
    _buttonTitleArray = buttonTitleArray;

    // 如果传递来新的数组，要先清除原来的 button
    for (int i = 0; i < _buttonTitleArray.count; i++) {
        UIView *view = [self viewWithTag:i + BUTTON_TAG_MASK];
        [view removeFromSuperview];
    }
    
    // 再添加新的 button
    [self addChannelToScrollView];
}

- (void)setButtonActionBlock:(TitleButtonAction)block
{
    buttonActionBlock = block;
}

#pragma mark - 私有方法
- (void)addTitleHightlighBackgroundView
{
    // view 的 frame 在changeChannelButtonBackgroundAtButtonIndex方法中会被设置
    titleHighlightBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 25)];
    titleHighlightBackgroundView.backgroundColor = [UIColor colorWithRed:0.0/255
                                                                   green:161.0/255
                                                                    blue:226.0/255
                                                                   alpha:1.0];
    titleHighlightBackgroundView.layer.borderWidth = 1.0;
    titleHighlightBackgroundView.layer.cornerRadius = 3.0;
    titleHighlightBackgroundView.layer.borderColor = titleHighlightBackgroundView.backgroundColor.CGColor;
    
    [self addSubview:titleHighlightBackgroundView];
    
}

- (void)addChannelToScrollView
{
    float nextButtonOriginX = BUTTON_MARGIN;
    for (int i = 0; i < _buttonTitleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];        
        button.tag = i + BUTTON_TAG_MASK;
        
        [button setTitle:_buttonTitleArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        button.titleLabel.adjustsFontSizeToFitWidth = NO;
        [button setBackgroundColor:[UIColor clearColor]];

        
        // selected
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        // unselected
        [button setTitleColor:[UIColor colorWithRed:83.0/255 green:79.0/255 blue:78.0/255 alpha:1.0] forState:UIControlStateNormal];
        
        
        // 使用 sizeToFit 使 button 自动调整为合适大小，然后再调整其坐标
        [button sizeToFit];
        CGRect frame = button.frame;
        frame.origin.x = nextButtonOriginX;
        frame.origin.y = BUTTON_Y;
        frame.size.width += 4;
        frame.size.height = BUTTON_HEIGHT;
        button.frame = frame;
        [self addSubview:button];
        
        // 准备好一下个 button 的 x坐标。
        // 因为到了最后一个 buuton 时就不需要再计算下一个nextButtonOriginX，所以加一个判断. 同时这也方便了在后面计算 channelScrollView 的contentSize
        
        if (i <= _buttonTitleArray.count - 1) {
            nextButtonOriginX = frame.origin.x + frame.size.width + 2 * BUTTON_MARGIN;
        }
        
    }
    
    // 默认选中第一个 button
    [self animateSelectedButtonBackgroundAtIndex:0 animate:NO];
    
    // 重新计算 self 的 contentSize
    self.contentSize = CGSizeMake(nextButtonOriginX + BUTTON_MARGIN, self.frame.size.height);
}

- (void)animateSelectedButtonBackgroundAtIndex:(NSUInteger)index animate:(BOOL)animate
{
    // 将 titleHighlightBackgroundView 移动到相应 button 位置
    NSUInteger tag = index + BUTTON_TAG_MASK;
    UIButton *currentButton = (UIButton *)[self viewWithTag:tag];
    CGRect frame = currentButton.frame;
    
    
    [UIView animateWithDuration:(animate ? 0.25 : 0.0) animations:^{
        titleHighlightBackgroundView.frame = frame;
    }];

    // 如果 button 未显示全，要移动 scroll view，以将该 button 全显示出来
    frame.size.width += BUTTON_MARGIN;
    [self scrollRectToVisible:frame animated:animate];
}

/**
 *	title button 的响应方法
 *  在这里要先将先前的 button 的 selected状态清除，再设计新 button 的 selected 状态
 *	@param	button	被点击的 button
 */
- (void)buttonClick:(UIButton *)button
{
    
    NSUInteger index = button.tag - BUTTON_TAG_MASK;
    
    // 通过使用 selectedIndex 的 set 方法来执行其它 UI 变化，详见其 set 方法
    self.selectedIndex = index;
    if (buttonActionBlock) {
        buttonActionBlock(index);
    }
}

@end
