//
//  AppDelegate.m
//  CoreData
//
//  Created by Igor Tomych on 9/8/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import <CoreData/CoreData.h>

#import "Ticket.h"
@implementation AppDelegate

@synthesize persistentStoreCoordinator;
@synthesize managedObjectModel;
@synthesize managedContext;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    self.viewController.managedContext = [self managedObjectContext];
    
    NSLog(@"%@", self.viewController.managedContext);
    
    Ticket* ticket = [NSEntityDescription insertNewObjectForEntityForName:@"Ticket" inManagedObjectContext:self.viewController.managedContext];
    
    ticket.name = @"Ticket One!";
    
    NSError* error;
    [self.viewController.managedContext save:&error];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* description = [NSEntityDescription entityForName:@"Ticket" inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:description];
    
    
    NSArray *results = [[self managedObjectContext] executeFetchRequest:request error:&error];
    
    NSLog(@"%@", results);
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark Core data setup

- (NSManagedObjectModel*) managedObjectModel {
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator*) persistentStoreCoordinator {
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"Cookies.sqlite"];
    
    
    NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
	
	NSError *error;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }
    
    return persistentStoreCoordinator;
}

- (NSManagedObjectContext *) managedObjectContext {
    if (managedContext != nil) {
        return managedContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedContext = [NSManagedObjectContext new];
        [managedContext setPersistentStoreCoordinator:coordinator];
    }
    return managedContext;
}

@end
