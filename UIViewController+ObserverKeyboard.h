//
//  UIViewController+ObserverKeyboard.h
//  WYISOFramework
//
//  Created by wangyang on 13-8-6.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ObserverKeyboard)
- (void)observeKeyboard;


- (void)deobservKeyboardShow;
@end
