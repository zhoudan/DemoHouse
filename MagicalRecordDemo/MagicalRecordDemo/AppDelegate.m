//
//  AppDelegate.m
//  MagicalRecordDemo
//
//  Created by 周单单 on 16/4/1.
//  Copyright © 2016年 zhoudandan. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //默认初始化方式
//    [MagicalRecord setupCoreDataStack];
//    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    //[MagicalRecord setupCoreDataStackWithStoreNamed:@"NoAutoModel.sqlite"];
    
    
//
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path2 = [path stringByAppendingPathComponent:@"LocalModel.sqlite"];
    NSURL *docUrl = [NSURL fileURLWithPath:path2];
    
    NSLog(@"=-======docPath==%@===========url==%@",path2,docUrl);
    
    
//    NSFileManager *fm = [NSFileManager defaultManager];
//    
//    NSArray *arr = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
//    
//    NSURL *docURL = [arr[0] URLByAppendingPathComponent:@"LocalModel.sqlite"];
//    
    
    NSString *locStr = [[NSBundle mainBundle] pathForResource:@"LocalModel" ofType:@"sqlite"];
   NSURL *locURL = [NSURL fileURLWithPath:locStr];
    
    NSLog(@"***************docurl = %@=================locURL==%@",docUrl,locURL);
    
    
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    
    [fm copyItemAtURL:locURL toURL:docUrl error:&error];
     
     
    
//    
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"LocalModel.sqlite"];
    
//    
    Person *p = [Person MR_createEntity];
    p.name = @"文超";
    p.address = @"朝阳";
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    
    NSLog(@"localsqlitePath====%@",[NSPersistentStore MR_urlForStoreName:@"LocalModel.sqlite"]);
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"测试" forKey:@"ceshi"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    [MagicalRecord cleanUp];
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
