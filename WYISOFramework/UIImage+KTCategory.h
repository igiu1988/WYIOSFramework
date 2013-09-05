//
//  UIImageAdditions.h
//  Sample
//
//  Created by Kirby Turner on 2/7/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KTCategory)

- (UIImage *)imageScaleAspectToMaxSize:(CGFloat)newSize;
- (UIImage *)imageScaleAndCropToMaxSize:(CGSize)newSize;

@end
