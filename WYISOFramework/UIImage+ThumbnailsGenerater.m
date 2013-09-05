//
//  UIImage+ThumbnailsGenerater.m
//  scalImage
//
//  Created by wangyang on 13-8-27.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "UIImage+ThumbnailsGenerater.h"
#import "UIImage+KTCategory.h"

@implementation UIImage (ThumbnailsGenerater)

+ (void)generateThumbnailsWithFileName:(NSString *)name
                         thumbnailSize:(CGSize)size
                         thumbnailName:(NSString *)thumbnailName
                       saveToDirectory:(NSString *)path
{
    UIImage *tempImage = [UIImage imageNamed:name];
    UIImage *scaleImage = [tempImage imageScaleAndCropToMaxSize:size];
    NSData *png = UIImagePNGRepresentation(scaleImage);
    
    NSString *thumbnailPath;
    if (thumbnailName) {
        thumbnailPath = [path stringByAppendingString:thumbnailName];
    }else{
        
        // 源图片可能是非 png 格式的，所以要先截取出图片的名字
        NSRange range = [name rangeOfString:@"." options:NSBackwardsSearch];
        NSString *tempName = [name substringWithRange:NSMakeRange(0, range.location)];
        
        // 再拼上路径及后缀
        thumbnailPath = [[path stringByAppendingPathComponent:tempName] stringByAppendingPathExtension:@"png"];
    }
    
    [png writeToFile:thumbnailPath atomically:NO];
}



@end
