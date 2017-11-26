//
//  MasterViewController.h
//  ObjCFinalProjTableViewTest
//
//  Created by John on 4/24/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <iAd/iAd.h>

#import "AppDelegate.h"

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, ADBannerViewDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property(nonatomic,strong) AppDelegate *appDelegate;

@property(nonatomic) int tableSortType;

@property(nonatomic, strong) ADBannerView *adBannerView;
@property(nonatomic) BOOL adBannerIsVisible;

- (IBAction)tableSections:(UISegmentedControl *)sender;

@end
