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

- (id)initWithSources:(NSArray *)sources
         cellIdentifier:(NSString *)identifier
          configureCell:(ConfigureCellBlock)block;

@end
