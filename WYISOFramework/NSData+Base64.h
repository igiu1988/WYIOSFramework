//
//  NSData+Base64.h
//  WYISOFramework
//
//  Created by wangyang on 13-12-17.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)
+ (NSString*)base64forData:(NSData*)theData;
@end
