//
//  WYCoreDataManager.m
//  WYISOFramework
//
//  Created by wangyang on 13-7-3.
//  Copyright (c) 2013年 wangyang. All rights reserved.
//

#import "WYCoreDataManager.h"

@implementation WYCoreDataManager

+ (WYCoreDataManager *)sharedDBManager
{
    static dispatch_once_t onceToken;
    static id shareInstance;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    
    return shareInstance;
}

- (id)init
{
    self = [super init];
    if (self){
        [self initCoreData];
    }
    
    return self;
}

- (void)initCoreData
{
    // 既然涉及数据库，肯定要有一个文件来存储数据
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSURL *storeUrl = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent:@"TestDB.sqlite"]];
    
    /* 初始化 managedObjectModel
     * managedObjectModel 的初始化是依据工程中的xcdatamodeld文件，
     */
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    /* 初始化 persistentStoreCoordinator
     * persistentStoreCoordinator 的初始化需要刚才的 managedObjectModel，这里我添加了一个option，该option会在数据库的版本控制及轻量迁移中用到。
     * 数据库的版本控制及轻量迁移见另一篇文章: iOS Core Data Version
     */
    NSError *error;
    // option use for lightweight migration
    NSDictionary * option = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    // sqlite文件在运行完这一步就会创建出来
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:option error:&error]) {
        NSLog(@"%@: %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"], error.localizedDescription);
    }
    
    /* 初始化 managedObjectContext
     * managedObjectContext 的初始化需要上面的 persistentStoreCoordinator
     */
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    _managedObjectContext.persistentStoreCoordinator = _persistentStoreCoordinator;
}

- (BOOL)clearEntry:(NSString *)entryName
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entryName inManagedObjectContext:_managedObjectContext];
    [request setEntity:entity];
    [request setResultType:NSManagedObjectResultType];
    
    NSError *testError = nil;
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:request error:&testError];
    for (NSManagedObject *object in fetchResults) {
        [_managedObjectContext deleteObject:object];
    }
    
    NSError *error;
    [_managedObjectContext save:&error];
    if (error) {
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)clearDB
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"TestDB.sqlite"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:basePath]) {
        
        //Erase the persistent store from coordinator and also file manager.
        NSPersistentStore *store = [_persistentStoreCoordinator.persistentStores lastObject];
        NSError *error = nil;
        NSURL *storeURL = store.URL;
        [self.persistentStoreCoordinator removePersistentStore:store error:&error];
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
        
        //Make new persistent store for future saves
        if (![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSLog(@"重新创建数据库失败");
            // 重置标记
            return NO;
        }
    }
    
    return YES;
}


- (BOOL)addManagedObjectsUseBlock:(void (^)(void))block
{
    block();
    
    // save
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)deleteManagedObject:(NSManagedObject *)object
{
    [_managedObjectContext deleteObject:object];
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        return NO;
    }else{
        return YES;
    }
    
}

- (BOOL)updateDB
{
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        return NO;
    }else{
        return YES;
    }
}

- (NSArray *)queryWithRequest:(NSFetchRequest *)request
{
    NSError *error = nil;
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        return nil;
    }else{
        return fetchResults;
    }
}
@end
