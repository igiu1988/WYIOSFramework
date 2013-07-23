//
//  WYLoginModel.m
//  OrderMeal
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "WYLoginModel.h"

@interface WYLoginModel () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSURLResponse *loginResponse;
    finishBlock _compeleteBlock;
}
@end

@implementation WYLoginModel

- (id)initWithOption:(WYLoginModelOption)option
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _option = option;
    return self;
}
- (void)performLoginService:(NSString *)serviceURL
            withCompeletion:(finishBlock)compeleteBlock
{
    _compeleteBlock = compeleteBlock;
    
    
    NSURL *url = [NSURL URLWithString:[NSURL URLWithString:serviceURL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (_option == WYLoginModelOptionResponse) {
        if (_compeleteBlock) {
            _compeleteBlock(response, nil, _option);
        }
    }else{
        loginResponse = response;
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (_option == WYLoginModelOptionGetData) {
        if (_compeleteBlock) {
            _compeleteBlock(loginResponse, data, _option);
        }
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (_compeleteBlock) {
        _compeleteBlock(nil, nil, _option);
    }
}

@end
