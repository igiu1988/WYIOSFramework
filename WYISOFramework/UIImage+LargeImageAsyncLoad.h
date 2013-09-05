//
//  UIImage+LargeImageSyncLoad.h
//  WYISOFramework
//
//  Created by wangyang on 13-9-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LargeImageAsyncLoad)
+ (void)loadLargeImageWithImagePath:(NSString *)path
                               drawBlock:(void(^)(UIImage *largeImage))drawBlock;
@end
