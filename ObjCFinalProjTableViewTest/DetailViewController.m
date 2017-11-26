//
//  DetailViewController.m
//  ObjCFinalProjTableViewTest
//
//  Created by John on 4/24/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <AVFoundation/AVPlayer.h>
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize appDelegate = _appDelegate;

@synthesize adBannerView = _adBannerView;
@synthesize adBannerIsVisible = _adBannerIsVisible;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
        [self playStream];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self playStream];
    
    //_adBannerView = [[ADBannerView alloc] initWithFrame:];
    //_adBannerView = [[ADBannerView alloc] init];
    //_adBannerView.frame = (0,366,320,50);
    [self.view addSubview:_adBannerView];
    _adBannerView.delegate=self;
    self.adBannerIsVisible=NO;
    [super viewDidLoad];
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem)
    {
        self.callLetters.text = [[self.detailItem valueForKey:@"callLetters"] description];
        
        self.frequencyBand.text = [[self.detailItem valueForKey:@"frequencyBand"] description];
        
        if ([self.frequencyBand.text isEqualToString:@"AM"])
        {
            self.detailDescriptionLabel.text = [[NSString stringWithFormat: @"%1.0f",[[self.detailItem valueForKey:@"frequency"] doubleValue]] description];
        }
        else if([self.frequencyBand.text isEqualToString:@"FM"])
        {
            self.detailDescriptionLabel.text = [[NSString stringWithFormat: @"%1.1f",[[self.detailItem valueForKey:@"frequency"] doubleValue]] description];
        }
        
        //self.detailDescriptionLabel.text = [[NSDecimalNumber decimalNumberWithString: [[self.detailItem valueForKey:@"frequency"] description]] descriptionWithLocale:[NSLocale systemLocale]];
        //self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@",[[self.detailItem valueForKey:@"frequency"] description]];
        
        //[self.uiwvWebpage loadHTMLString: [self.detailItem valueForKey:@"websiteURL"] baseURL:[NSURL URLWithString: [[self.detailItem valueForKey:@"websiteURL"] description]]];
        [self.uiwvWebpage loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: [[self.detailItem valueForKey:@"websiteURL"] description]]]];
    }
}

-(void)resetStream
{
    [self.appDelegate.avp pause];
    self.appDelegate.avpi = nil;
    self.appDelegate.avp = nil;
    //
    self.isPlaying = FALSE;
    [self.playPauseToggle setTitle: @"Play" forState: UIControlStateNormal];
    //
    //self.uibbiOutletPlay.style = UIBarButtonItemStylePlain;
    //self.uibbiOutletPlay.style = UIBarButtonItemStyleDone;
}

-(void)playStream
{
    [self resetStream];
    //
    NSURL *nsu = [NSURL URLWithString: [[self.detailItem valueForKey:@"streamURL"] description]];
    //NSURL *nsu = [NSURL URLWithString: @"http://5543.live.streamtheworld.com:80/WGNAM_SC"];
    //AVPlayer *avp = [AVPlayer playerWithURL: nsu];
    //[self.avp [AVPlayer playerWithURL: nsu]];
    //NSURL *nsu = [NSURL URLWithString: @"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"];
    //
    self.appDelegate.avpi = [[AVPlayerItem alloc] initWithURL: nsu];
    self.appDelegate.avp = [[AVPlayer alloc] initWithPlayerItem: self.appDelegate.avpi];
    [self.appDelegate.avp play];
    //
    self.isPlaying = TRUE;
    [self.playPauseToggle setTitle: @"Pause" forState: UIControlStateNormal];
    //
    //self.uibbiOutletPlay.style = UIBarButtonItemStyleDone;
    //self.uibbiOutletPlay.style = UIBarButtonItemStylePlain;
    //
    //NSLog(@"\n\nPlay Stream\n");
    //NSLog([[self.detailItem valueForKey:@"streamURL"] description]);
}

-(IBAction) playPause:(UIButton *)sender
{
    if(self.isPlaying)
    {
        [self resetStream];
    }
    else
    {
        [self playStream];
    }
}

/*
-(IBAction) play: (UIBarButtonItem*) sender
{
    [self playStream];
}

-(IBAction) pause: (UIBarButtonItem*) sender
{
    [self resetStream];
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.adBannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // Assumes the banner view is just off the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        self.uivSubview.frame = CGRectOffset(self.uivSubview.frame, 0, -self.uivSubview.frame.size.height);
        [UIView commitAnimations];
        self.adBannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.adBannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // Assumes the banner view is placed at the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        self.uivSubview.frame = CGRectOffset(self.uivSubview.frame, 0, self.uivSubview.frame.size.height);
        [UIView commitAnimations];
        self.adBannerIsVisible = NO;
    }
}

@end
