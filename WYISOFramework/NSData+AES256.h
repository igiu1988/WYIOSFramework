//
//  NSObject+AES256.h
//  kaeuta
//
//  Created by wang yang on 13-4-15.
//  Copyright (c) 2013年 lifevar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)
- (NSData*)AES256EncryptWithKey:(NSString*)key;
- (NSData*)AES256DecryptWithKey:(NSString*)key;
@end
