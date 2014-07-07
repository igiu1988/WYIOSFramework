//
//  UIImage+CaptureImage.m
//  WYISOFramework
//
//  Created by wangyang on 6/26/14.
//  Copyright (c) 2014 wangyang. All rights reserved.
//

#import "UIImage+CaptureImage.h"

@implementation UIImage (CaptureImage)
- (UIImage *)captureImageForView:(UIView *)targetView
{
    // draw a view's contents into an image context
    UIGraphicsBeginImageContext(targetView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [targetView.layer renderInContext:context];
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    UIGraphicsEndImageContext();
    UIImage *image = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);
    
    return image;
}
@end
