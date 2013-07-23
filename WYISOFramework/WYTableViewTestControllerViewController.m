//
//  WYTableViewTestControllerViewController.m
//  WYISOFramework
//
//  Created by wangyang on 13-7-17.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYTableViewTestControllerViewController.h"
#import "WYTableView.h"
#import "WYTableViewDataSource.h"

@interface WYTableViewTestControllerViewController ()
{
    __weak IBOutlet WYTableView *testTableView;
    WYTableViewDataSource *dataSource;
}
@end

@implementation WYTableViewTestControllerViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = @[@"1", @"2", @"3"];
    dataSource = [[WYTableViewDataSource alloc]
                                         initWithSources:array
                                         cellIdentifier:@"wycell"
                                         configureCell:^(UITableViewCell *cell, NSIndexPath *indexPath) {
                                             
                                             cell.textLabel.text = array[indexPath.row];
                                         }];
	
    testTableView.dataSource = dataSource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
