//
//  WYLoginModel.h
//  OrderMeal
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 对于不同的需求
 1. 可能该软件只需要使用http response的status code即可以来判断是否登录成功，这个时候使用WYLoginModelOptionResponse
 2. 复杂的软件可能需要服务器返回一段json数据来判断是否登录成功，这个时候使用WYLoginModelOptionGetData
 该option必须被指定
 */
typedef enum _kWYLoginModelOption
{
    WYLoginModelOptionResponse = 1,         // 应答只使用response来判断是否登录成功
    WYLoginModelOptionGetData               // 应答receivedData来判断是否登录成功
    
}WYLoginModelOption;


/**
    对于正常情况来说
	1. 如果option是WYLoginModelOptionResponse，那么response != nil, receivedData == nil
    2. 如果option是WYLoginModelOptionGetData，那么response != nil, receivedData != nil
    非正常情况的话
    1. response == nil, receivedData == nil
    你可以根据response及receivedData来处理登录结果，
 */
typedef void (^finishBlock)(NSURLResponse *response, NSData *receivedData, WYLoginModelOption option);


/**
	只处理登录流程的网络连接操作，使用initWithOption:初始化，使用performLoginService:withCompeletion来发起登录请求
 */
@interface WYLoginModel : NSObject

@property (nonatomic, readonly, assign) WYLoginModelOption option;

/**
	使用该方法来初始化WYLoginModel
	@param option 参见上面对WYLoginModelOption的介绍
	@returns 返回WYLoginModel对象
 */
- (id)initWithOption:(WYLoginModelOption)option;

/**
	使用该方法执行登录请求，
	@param serviceURL 这个URL应该先拼好，比如 http://test.com/project/v1/jogin?user=xxx&pwd=xxx
	@param compeleteBlock 登录请求结束执行该block，具体内容见finishBlock的定义
 */
- (void)performLoginService:(NSString *)serviceURL
            withCompeletion:(finishBlock)compeleteBlock;

@end
