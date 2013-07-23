//
//  UIImage+ResolutionIndependent.m
//  kaeuta
//
//  Created by wangyang on 13-4-1.
//  Copyright (c) 2013年 lifevar. All rights reserved.
//

#import "UIImage+ResolutionIndependent.h"

@implementation UIImage (ResolutionIndependent)

- (id)initWithContentsOfResolutionIndependentFile:(NSString *)path {
    NSString *newPath = [[path stringByDeletingPathExtension] stringByAppendingPathExtension:@"png"];
    
    if ( [[[UIDevice currentDevice] systemVersion] intValue] >= 4 && [[UIScreen mainScreen] scale] == 2.0 ) {
        NSString *path2x = [[newPath stringByDeletingLastPathComponent]
                            stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.%@",
                                                            [[newPath lastPathComponent] stringByDeletingPathExtension],
                                                            [newPath pathExtension]]];
        
        if ( [[NSFileManager defaultManager] fileExistsAtPath:path2x] ) {
            return [self initWithCGImage:[[UIImage imageWithData:[NSData dataWithContentsOfFile:path2x]] CGImage] scale:2.0 orientation:UIImageOrientationUp];
        }
    }
    
    return [self initWithData:[NSData dataWithContentsOfFile:newPath]];
}

+ (UIImage*)imageWithContentsOfResolutionIndependentFile:(NSString *)path {
    
    return [[UIImage alloc] initWithContentsOfResolutionIndependentFile:path];
}

@end
