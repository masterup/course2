//
//  AppDelegate.h
//  CoreData
//
//  Created by Igor Tomych on 9/8/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic, readonly) NSManagedObjectContext* managedContext;
@property (strong, nonatomic, readonly) NSManagedObjectModel* managedObjectModel;
@property (strong, nonatomic, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

@end
