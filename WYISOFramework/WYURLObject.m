//
//  WYURLObject.m
//  WYISOFramework
//
//  Created by wangyang on 13-11-4.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYURLObject.h"

@implementation WYURLObject
- (void)testURL
{
    NSString *firstPart = @"http://liaoning.youbianku.com/%E5%88%86%E7%B1%BB/%E5%9C%B0%E5%8C%BA/%E8%BE%BD%E5%AE%81%E7%9C%81/%E4%B8%B9%E4%B8%9C%E5%B8%82/";
    
    // 将中文转义，再与firstPart拼接
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)@"东港市", NULL, (CFStringRef)@"!*’();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    
    NSString *wholeURLString = [firstPart stringByAppendingPathComponent:encodedString];
    NSURL *url = [NSURL URLWithString:wholeURLString];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:url] returningResponse:&response error:&error];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
}
@end
