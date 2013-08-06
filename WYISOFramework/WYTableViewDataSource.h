//
//  WYTableViewDataSource.h
//  WYISOFramework
//
//  Created by wangyang on 13-7-17.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ConfigureCellBlock) (UITableViewCell *cell, NSIndexPath *indexPath);
@interface WYTableViewDataSource : NSObject <UITableViewDataSource>

// 如果需要切换table view要显示的source，可以使用该属性切换
@property (nonatomic, strong) NSArray *sources;

- (id)initWithSources:(NSArray *)sources
         cellIdentifier:(NSString *)identifier
          configureCell:(ConfigureCellBlock)block;


@end
