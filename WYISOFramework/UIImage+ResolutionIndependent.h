//
//  UIImage+ResolutionIndependent.h
//  kaeuta
//
//  Created by wangyang on 13-4-1.
//  Copyright (c) 2013年 lifevar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResolutionIndependent)
- (id)initWithContentsOfResolutionIndependentFile:(NSString *)path;
+ (UIImage*)imageWithContentsOfResolutionIndependentFile:(NSString *)path;

@end
