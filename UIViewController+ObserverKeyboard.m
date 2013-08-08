//
//  UIViewController+ObserverKeyboard.m
//  WYISOFramework
//
//  Created by wangyang on 13-8-6.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "UIViewController+ObserverKeyboard.h"
#import "UIResponder+FirstResponder.h"

@implementation UIViewController (ObserverKeyboard)

- (void)didReceiveKeyboardWillShowNotification:(NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
    
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView *view = [UIResponder currentFirstResponder];
    
    // bottom Y
    CGFloat bottomY = view.frame.origin.y + view.frame.size.height+ 64;
    
    CGFloat keyboardY = keyboardRect.origin.y;
    if (bottomY > keyboardY)
    {
        CGFloat offset = keyboardY - bottomY;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.35];
        CGRect frame = self.view.frame;
        frame.origin.y = offset - 5;
        self.view.frame = frame;
        [UIView commitAnimations];
    }
}



- (void)observeKeyboard
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardWillShowNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
}

- (void)deobservKeyboardShow
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}


@end
