//
//  UIImage+ThumbnailsGenerater.h
//  scalImage
//
//  Created by wangyang on 13-8-27.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ThumbnailsGenerater)

/**
 *	@param name             图片的名字，应该是 abc.png 或者 abc.jpg 等 iOS 系统 支持显示的图片。
 *  @param size             图片将要被缩放到的大小。
 *  @param thumbnailName    指定缩略图的名字。如果该参数为空，那么缩略图片名将与原图片名字相同，文件类型是 png。
 *  @param path             缩略图将要被存放的位置。path 应该使用NSFileManager生成的路径, 可参见NSFileManager+MostUsePath.h如何创建路径
 */
+ (void)generateThumbnailsWithFileName:(NSString *)name
                         thumbnailSize:(CGSize)size
                         thumbnailName:(NSString *)thumbnailName
                       saveToDirectory:(NSString *)path;
@end
