//
//  UIImage+PureColorImage.h
//  SjNews
//
//  Created by wangyang on 13-7-30.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PureColorImage)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
@end
