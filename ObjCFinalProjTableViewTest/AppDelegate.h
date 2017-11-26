//
//  AppDelegate.h
//  ObjCFinalProjTableViewTest
//
//  Created by John on 4/24/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerItem.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) AVPlayer *avp;
@property (strong, nonatomic) AVPlayerItem *avpi;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
