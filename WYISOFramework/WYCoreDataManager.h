//
//  WYCoreDataManager.h
//  WYISOFramework
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


/**
	1. 尽量不要在controller里使用该类，根据不同软件需求，最好再创建一层model
        controller--->yourModel---->WYCoreDataManager
    2. 需要引入 CoreData.framework
 */
@interface WYCoreDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/**
 由于多处可能会用到Core Data，直接使用同一个对象会更方便些
 @returns 返回一个单例的OMDBManager实例
 */
+ (WYCoreDataManager *)sharedDBManager;

/**
 增加
 
 block的内容应该类似如下代码：
 
 NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"OrderList" inManagedObjectContext:sql.managedObjectContext];
 object.objectId = @"02012";
 
 @returns 添加成功返回YES
 */
- (BOOL)addManagedObjectsUseBlock:(void (^)(void))block;

// 删除
- (BOOL)deleteManagedObject:(NSManagedObject *)object;

// 更新
// 如果某个NSManagedObject的对象已经做了更改，直接使用该方法将更改保存到core data
- (BOOL)updateDB;

// 查询
- (NSArray *)queryWithRequest:(NSFetchRequest *)request;

/**
 在重新下载数据时需要先删除数据库其中的内容。
 注意，只是删除数据库内容，并没有删掉数据库文件。
 @returns 如果返回NO说明未删除成功
 */
- (BOOL)clearDB;


/**
 只清空某个表中的所有记录
 @param entryName 表名
 @returns 如果操作成功，返回YES
 */
- (BOOL)clearEntry:(NSString *)entryName;
@end
