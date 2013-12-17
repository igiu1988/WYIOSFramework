//
//  WYMath.m
//  WYISOFramework
//
//  Created by wangyang on 13-11-11.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYMath.h"

@implementation WYMath
+(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{
    float distance = sqrt(pow((end.x - start.x), 2.0) + pow((end.y - start.y), 2.0));
    return distance;
}
@end
