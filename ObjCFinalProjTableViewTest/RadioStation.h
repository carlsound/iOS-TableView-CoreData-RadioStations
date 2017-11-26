//
//  RadioStation.h
//  ObjCFinalProjTableViewTest
//
//  Created by John on 4/24/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RadioStation : NSManagedObject

@property (nonatomic, retain) NSString * callLetters;
@property (nonatomic, retain) NSNumber * frequency;
@property (nonatomic, retain) NSString * streamURL;
@property (nonatomic, retain) NSString * websiteURL;
@property (nonatomic, retain) NSString * frequencyBand;

@end
