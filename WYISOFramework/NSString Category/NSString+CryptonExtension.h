//
//  NSString+CryptonExtension.h
//  WYISOFramework
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CryptonExtension)


+ (NSString *)fileNameFromPath:(NSString *)path;

// md5
- (NSString *)md5;

// AES256
+ (NSData*)AES256Encrypt:(NSString*)strSource withKey:(NSString*)key;
+ (NSString*)AES256Decrypt:(NSData*)dataSource withKey:(NSString*)key;

@end
