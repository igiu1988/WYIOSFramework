//
//  WYImageDownloader.m
//  OrderMeal
//
//  Created by wangyang on 13-7-2.
//  Copyright (c) 2013年 forsoft. All rights reserved.
//

#import "WYImageDownloader.h"

#define IMAGE_DIR     @"someDir"
@interface WYImageDownloader () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSArray *imageUrlArray;
    progressingBlock progressBlock;
    void (^compeleteBlock)(BOOL success);
    
    NSString *imageDir;
    
    long long currentImageTotalLength;
    NSString *currentImageName;
    NSMutableData *receivedData;
}

@property (assign, nonatomic) NSUInteger downloadCounter;
@end

@implementation WYImageDownloader

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    receivedData = [NSMutableData data];
    
    // 清空图片目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    imageDir = [[paths objectAtIndex:0] stringByAppendingPathComponent:IMAGE_DIR];
    [[NSFileManager defaultManager] removeItemAtPath:imageDir error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:nil];
    
    
    [self addObserver:self forKeyPath:@"downloadCounter" options:NSKeyValueObservingOptionNew context:nil];
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"downloadCounter"]) {
        
        if (_downloadCounter == imageUrlArray.count) {
            [self removeObserver:self forKeyPath:@"downloadCounter"];
            compeleteBlock(YES);
            return;
        }
        
        NSURL *imageURL = [NSURL URLWithString:imageUrlArray[_downloadCounter]];
        currentImageName = [imageURL.absoluteString lastPathComponent];
        NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
        [NSURLConnection connectionWithRequest:request delegate:self];
        
        progressBlock(_downloadCounter, imageUrlArray.count, 0);
    }
}

- (void)downloadImages:(NSArray *)imageArray
           progressing:(progressingBlock)progressingBlock
             compelete:(void (^)(BOOL success))block
{
    progressBlock = progressingBlock;
    compeleteBlock = block;
    
    imageUrlArray = imageArray;
    self.downloadCounter = 0;
}

#pragma mark - NSURLConnectiong Delegate
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    currentImageTotalLength = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
    float percent = (float)receivedData.length / currentImageTotalLength;
    dispatch_async(dispatch_get_main_queue(), ^{
        progressBlock(_downloadCounter, imageUrlArray.count, percent);
    });
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    dispatch_async(dispatch_get_main_queue(), ^{
        progressBlock(_downloadCounter, imageUrlArray.count, 1.0);
    });
    // 保存下载的图片
    NSString *filePath = [imageDir stringByAppendingPathComponent:currentImageName];
    BOOL success = [[NSFileManager defaultManager] createFileAtPath:filePath contents:receivedData attributes:nil];
    if (!success) {
        NSLog(@"%@的图片保存失败", currentImageName);
    }else{
        NSLog(@"%@图片已下载", currentImageName);
    }
    
    // 清空存储器
    receivedData = nil;
    receivedData = [NSMutableData data];
    // 执行下一个下载
    ++ self.downloadCounter ;
}


- (void)GCDDownloadImages:(NSMutableArray *)imageArray compelete:(void (^) (BOOL success))block
{
    // 取出图片存放路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:IMAGE_DIR];
    [[NSFileManager defaultManager] removeItemAtPath:basePath error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:nil error:nil];
    
    // 因为要循环下载多个图片，如果在主线程上执行，将不能更新UI，必须在另一个线程上执行，需要更新UI时使用dispatch_async
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // 开启一个线程去下载图片
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i<imageArray.count; i++) {
            
            // 在主线程上更新UI
            // Do your presumably useful work, not just looping for fun :-)
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI updates always come from the main queue!
                if (progressBlock) {
                    progressBlock(i + 1, imageArray.count, 0);
                }
            });
            
            
            NSMutableDictionary *dic = imageArray[i];
            NSString *imageURL = dic[@"picUrl"];
            NSString *lastPath = [imageURL lastPathComponent];
            
            // 如果是一个空串，就我们自己加一个上。
            if ([lastPath isEqualToString:@"null"]) {
                imageURL = [[[imageURL substringWithRange:NSMakeRange(0, imageURL.length - 4)] stringByAppendingPathComponent:dic[@"id"]] stringByAppendingPathExtension:@"jpg"];
                
            }
            
            dic[@"picUrl"]= imageURL;
            
            NSError *error;
            NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageURL] options:NSDataReadingUncached error:&error];
            if (error)
            {
                NSLog(@"%@的图片下载失败，菜id: %@", dic[@"name"], dic[@"id"]);
            }else{
                // 给图片一个名字
                NSString *filePath = [basePath stringByAppendingPathComponent:[imageURL lastPathComponent]];
                BOOL success = [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
                if (!success) {
                    NSLog(@"%@的图片保存失败，菜id: %@", dic[@"name"], dic[@"id"]);
                }else{
                    NSLog(@"%@图片已下载", dic[@"id"]);
                }
                
            }
            
            if (i == imageArray.count - 1) {
                // NSLog(@"所有图片已下载");
                
                // 在主线程上更新UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(YES);
                });
            }
        }
        
        
        
    });
    
}

@end
