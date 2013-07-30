//
//  WYSimpleNetwork.m
//  SjNews
//
//  Created by wangyang on 13-7-19.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import "WYSimpleNetwork.h"


@interface WYSimpleNetwork () <NSURLConnectionDataDelegate, NSURLConnectionDelegate>
{
    NSMutableData *downloadData;
}
@end

@implementation WYSimpleNetwork
+ (WYSimpleNetwork *)shareNetwork
{
    static dispatch_once_t onceToken;
    static WYSimpleNetwork *network;
    dispatch_once(&onceToken, ^{
        network = [[self alloc] init];
    });
    
    return network;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
    
}

- (void)request:(NSURLRequest *)request compeletion:(CompeleteBlock)connectionCompeleteBlock
{
    
    downloadData = nil;
    downloadData = [NSMutableData data];
    _connectionCompeleteBlock = connectionCompeleteBlock;
    
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [downloadData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"连接出现错误 %@", [error localizedDescription]);
    _connectionCompeleteBlock(nil, connection, error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _connectionCompeleteBlock(downloadData, connection, nil);
}

@end
