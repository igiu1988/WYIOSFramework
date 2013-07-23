//
//  WYImageDownloader.h
//  OrderMeal
//
//  Created by wangyang on 13-7-2.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^progressingBlock)(NSUInteger currentIndex, NSUInteger totalCount, float progress);

@interface WYImageDownloader : NSObject
- (void)downloadImages:(NSArray *)imageArray
           progressing:(progressingBlock)progressBlock
             compelete:(void (^)(BOOL success))block;
@end
