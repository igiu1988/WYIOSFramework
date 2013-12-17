//
//  WYColorTool.h
//  WYISOFramework
//
//  Created by wangyang on 13-11-6.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#ifndef WYISOFramework_WYColorTool_h
#define WYISOFramework_WYColorTool_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif
