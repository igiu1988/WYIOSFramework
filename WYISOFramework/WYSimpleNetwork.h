//
//  WYSimpleNetwork.h
//  SjNews
//
//  Created by wangyang on 13-7-19.
//  Copyright (c) 2013年 Wang Jing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompeleteBlock) (NSData *data, NSURLConnection *connection, NSError *error);

@interface WYSimpleNetwork : NSObject

@property (strong, nonatomic, readonly) CompeleteBlock connectionCompeleteBlock;

+ (WYSimpleNetwork *)shareNetwork;
- (void)request:(NSURLRequest *)request compeletion:(CompeleteBlock)connectionCompeleteBlock;
@end
