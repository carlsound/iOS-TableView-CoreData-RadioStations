//
//  DetailViewController.h
//  ObjCFinalProjTableViewTest
//
//  Created by John on 4/24/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <AVFoundation/AVPlayer.h>
#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

#import "AppDelegate.h"

@interface DetailViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *uivSubview;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *callLetters;
@property (weak, nonatomic) IBOutlet UILabel *frequencyBand;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIButton *playPauseToggle;
-(IBAction) playPause: (UIButton*) sender;
@property (assign, nonatomic) BOOL isPlaying;

/*
@property (weak, nonatomic) UIBarButtonItem *uibbiOutletPlay;
@property (weak, nonatomic) UIBarButtonItem *uibbiOutletPause;

-(IBAction) play: (UIBarButtonItem*) sender;
-(IBAction) pause: (UIBarButtonItem*) sender;
*/

@property (weak, nonatomic) IBOutlet UIWebView *uiwvWebpage;

@property(nonatomic,strong) AppDelegate *appDelegate;

@property(nonatomic, strong) ADBannerView *adBannerView;
@property(nonatomic) BOOL adBannerIsVisible;

@end
