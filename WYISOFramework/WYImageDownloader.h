//
//  WYImageDownloader.h
//  OrderMeal
//
//  Created by wangyang on 13-7-2.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^progressingBlock)(NSUInteger currentIndex, NSUInteger totalCount, float progress);

/**
 *	这个下载器只是用来批量下载图片，如果要显示图片，还是用 SDWebImage 吧
 */
@interface WYImageDownloader : NSObject
- (void)downloadImages:(NSArray *)imageArray
           progressing:(progressingBlock)progressBlock
             compelete:(void (^)(BOOL success))block;
@end
