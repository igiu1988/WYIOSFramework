//
//  UIImage+LargeImageSyncLoad.m
//  WYISOFramework
//
//  Created by wangyang on 13-9-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "UIImage+LargeImageAsyncLoad.h"

@implementation UIImage (LargeImageAsyncLoad)
+ (void)loadLargeImageWithImagePath:(NSString *)path
                               drawBlock:(void(^)(UIImage *largeImage))drawBlock{

    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    if (data) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            CFDataRef dataRef = (__bridge CFDataRef)data;
            CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData(dataRef);
            CGImageRef newImage = CGImageCreateWithPNGDataProvider(dataProvider,
                                                                   NULL, NO,
                                                                   kCGRenderingIntentDefault);
            //////////
            // force DECODE
            
            const int width = CGImageGetWidth(newImage);
            const int height = CGImageGetHeight(newImage);
            
            const CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
            const CGContextRef context = CGBitmapContextCreate(
                                                               NULL,
                                                               width, height,
                                                               8, width * 4,
                                                               colorspace, kCGBitmapAlphaInfoMask);
            
            NSParameterAssert(context);
            CGContextDrawImage(context, CGRectMake(0, 0, width, height), newImage);
            CGImageRef drawnImage = CGBitmapContextCreateImage(context);
            CGContextRelease(context);
            CGColorSpaceRelease(colorspace);
            
            //////////
            //这里是处理好的UIImage. 注意把它更新到UIImageView时要切换到主线程。 因为UIImageView不是线程安全的。 对界面的更新都要到主线程进行。
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (drawBlock) {
                    drawBlock([UIImage imageWithCGImage:drawnImage]);
                };
            });
            //////
            CGDataProviderRelease(dataProvider);
            CGImageRelease(newImage);
            CGImageRelease(drawnImage);
            
        });
    }
}
@end
