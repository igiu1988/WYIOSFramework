//
//  WYTableViewDataSource.m
//  WYISOFramework
//
//  Created by wangyang on 13-7-17.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYTableViewDataSource.h"
@interface WYTableViewDataSource ()
{
    NSArray *tableSource;
    NSString *cellIdentifier;
    ConfigureCellBlock configBlock;
}

@end

@implementation WYTableViewDataSource

- (id)initWithSources:(NSArray *)sources
         cellIdentifier:(NSString *)identifier
          configureCell:(ConfigureCellBlock)block
{
    if (self = [super init]) {
        tableSource = sources;
        cellIdentifier = identifier;
        configBlock = block;
    }else{
        return nil;
    }
    
    return self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableSource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wycell"];
    }
    configBlock(cell, indexPath);
    
    return cell;
}
@end
