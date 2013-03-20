//
//  AppDelegate.h
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDKTestIncrementalStore.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
