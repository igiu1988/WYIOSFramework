//
//  UIImage+PureColorImage.m
//  SjNews
//
//  Created by wangyang on 13-7-30.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import "UIImage+PureColorImage.h"

@implementation UIImage (PureColorImage)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIImage *img = nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);
    
    img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
@end
