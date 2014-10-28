//
//  ClassicEasy.m
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "ClassicEasy.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

NSInteger ClassicEasyNumber;

@interface ClassicEasy ()

@end

@implementation ClassicEasy

#pragma Buttons

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)RedButton:(id)sender
{
    ButtonPressed = ButtonPressed + 1;
    [ClassicEasyTimer invalidate];
    ClassicEasyTimer = nil;
    [self Game];
    
    int SoundNumber = arc4random() % 5;
    
    NSString *sound;
    
    switch (SoundNumber) {
        case 0:
            sound = @"LaSoundOne";
            break;
        case 1:
            sound = @"LaSoundTwo";
            break;
        case 2:
            sound = @"LaSoundThree";
            break;
        case 3:
            sound = @"LaSoundFour";
            break;
        case 4:
            sound = @"LaSoundFive";
            break;
        default:
            break;
    }
    
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:sound ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

-(IBAction)WrongButton:(id)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    [self Dead];
    [ClassicEasyTimer invalidate];
    ClassicEasyTimer = nil;
}

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
}

#pragma Mark The Banner

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    [banner setAlpha:0.5];
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    [banner setAlpha:0];
    [UIView commitAnimations];
    Banner.hidden = YES;
}


#pragma Mark The Actual Game

-(void)Game
{
    ClassicEasyTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Score) userInfo:nil repeats:YES];
    
    if (ButtonPressed == 15) {
        [self GameOver];
    }
    
    InGameCounter.text = [NSString stringWithFormat:@"%i of 15", ButtonPressed];
    
    Place = arc4random_uniform(9);
    
    switch (Place) {
        case 0:
            if (IDIOM == IPAD) {
                NSLog(@"IPAD");
                RedButton.center = CGPointMake(116, 227); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonOne.center = CGPointMake(384,227 ); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(652, 227); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(116, 585); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(652, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            RedButton.center = CGPointMake(60, 117); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonOne.center = CGPointMake(168, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(271, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(60, 284); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(168, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 1:
            if (IDIOM == IPAD) {
                NSLog(@"IPAD");
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                RedButton.center = CGPointMake(384,227 ); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonTwo.center = CGPointMake(652, 227); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(116, 585); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(652, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            RedButton.center = CGPointMake(168, 117); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonTwo.center = CGPointMake(271, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(60, 284); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(168, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 2:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                RedButton.center = CGPointMake(652, 227); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonThree.center = CGPointMake(116, 585); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(652, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            RedButton.center = CGPointMake(271, 117); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonThree.center = CGPointMake(60, 284); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(168, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 3:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                RedButton.center = CGPointMake(116, 585); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonFour.center = CGPointMake(384, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(652, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            RedButton.center = CGPointMake(60, 284); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonFour.center = CGPointMake(168, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 4:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(116, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                RedButton.center = CGPointMake(384, 585); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonFive.center = CGPointMake(652, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            RedButton.center = CGPointMake(168, 284); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 5:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(116, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                RedButton.center = CGPointMake(652, 585); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonSix.center = CGPointMake(116, 904); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(168, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            RedButton.center = CGPointMake(271, 284); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 6:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(116, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(652, 585); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                RedButton.center = CGPointMake(116, 904); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonSeven.center = CGPointMake(384, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(168, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(271, 284); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            RedButton.center = CGPointMake(60, 451); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 7:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(116, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(652, 585); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(116, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                RedButton.center = CGPointMake(384, 904); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonEight.center = CGPointMake(652, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(168, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(271, 284); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(60, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            RedButton.center = CGPointMake(168, 451); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            }
            break;
        case 8:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384,227 ); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(652, 227); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(116, 585); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 585); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(652, 585); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(116, 904); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(384, 904); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                RedButton.center = CGPointMake(652, 904); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            } else {
            OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
            OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
            OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
            OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
            OtherButtonFive.center = CGPointMake(168, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
            OtherButtonSix.center = CGPointMake(271, 284); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
            OtherButtonSeven.center = CGPointMake(60, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
            OtherButtonEight.center = CGPointMake(168, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
            RedButton.center = CGPointMake(271, 451); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            }
            break;
        default:
            break;
    }
}

-(void)Score
{
    Counter = Counter + 0.01;
    NSLog(@"%.2f", Counter);
    InGameScore.text = [NSString stringWithFormat:@"%.2f", Counter];
    if (ButtonPressed >= 15) {
        [ClassicEasyTimer invalidate];
        ClassicEasyTimer = nil;
    }
    if (ClassicEasyTimer == nil) {
        NSLog(@"The Timer has been invalidated");
    }
}


-(void)Dead
{
    [self Fadein];
    [ClassicEasyTimer invalidate];
    ClassicEasyTimer = nil;
    
    Dead.hidden = NO;
    Home.hidden = NO;
    InGameCounter.hidden = YES;
    Replay.hidden = NO;
    InGameScore.hidden = YES;
    HighScore.hidden = NO;
    HighScore.text = [NSString stringWithFormat:@"%.2f", HighScoreNumber];
    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
}

-(void)Fadein
{
    [Home setAlpha:0];
    [Replay setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [Home setAlpha:1];
    [Replay setAlpha:1];
    [UIView commitAnimations];
}


-(void)reportScore
{
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Classic_Easy_Leaderboard"]; //Leaderboard name
    int64_t GameCenterScoreOne = (int64_t) (HighScoreNumber * 100.00f); // All numbers must be sent in a int64, if you have got a decimal point you do what i have doe here, highscore is a float/double *100 to gte .2dp *1000 for .3dp
    score.value = GameCenterScoreOne;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)GameOver
{
    [self Fadein];
    [ClassicEasyTimer invalidate];
    ClassicEasyTimer = nil;
    
    Display.hidden = NO;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    InGameCounter.hidden = YES;
    InGameScore.hidden = YES;
    Home.hidden = NO;
    Replay.hidden = NO;
    
    if (Counter < HighScoreNumber || HighScoreNumber == 0) {
        HighScoreNumber = Counter;
        [[NSUserDefaults standardUserDefaults] setDouble:HighScoreNumber forKey:@"HighScoreClassicSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%.2f", Counter];
    HighScore.text = [NSString stringWithFormat:@"%.2f",  HighScoreNumber];
    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
    
    ClassicEasyNumber = 1;
    [[NSUserDefaults standardUserDefaults] setInteger:ClassicEasyNumber forKey:@"ClassicEasyComplete"];
}

#pragma Mark The Game View

- (void)viewDidLoad
{
    ClassicEasyNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"ClassicEasyComplete"];
    
    RedButton.hidden = NO, OtherButtonOne.hidden = NO, OtherButtonTwo.hidden = NO, OtherButtonThree.hidden = NO, OtherButtonFour.hidden = NO, OtherButtonFive.hidden = NO, OtherButtonSix.hidden = NO, OtherButtonSeven.hidden = NO, OtherButtonEight.hidden = NO, OtherButtonNine.hidden = NO, OtherButtonTen.hidden = NO, OtherButtonEleven.hidden = NO;
    InGameCounter.hidden = NO;
    RedTouch.hidden = NO, OtherTouchOne.hidden = NO, OtherTouchTwo.hidden = NO, OtherTouchThree.hidden = NO, OtherTouchFour.hidden = NO, OtherTouchFive.hidden = NO, OtherTouchSix.hidden = NO, OtherTouchSeven.hidden = NO, OtherTouchEight.hidden = NO, OtherTouchNine.hidden = NO, OtherTouchTen.hidden = NO, OtherTouchEleven.hidden = NO;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] doubleForKey:@"HighScoreClassicSaved"];
    
    if (HighScoreNumber == 0) {
        NSString *Class = @"You have 15 buttons to tap as fast as you can! And don't hit the black buttons or the game will be over.";
        
        UIAlertView *ClassAlert = [[UIAlertView alloc] initWithTitle:@"Classic Help" message:Class delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [ClassAlert show];
    }
    
    [super viewDidLoad];
    
    ButtonPressed = 0;
    Counter = 0;
    
    if (IDIOM == IPAD) {
        
    } else {
    
    OtherButtonOne.center = CGPointMake(60, 117); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
    OtherButtonTwo.center = CGPointMake(168, 117); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
    OtherButtonThree.center = CGPointMake(271, 117); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
    OtherButtonFour.center = CGPointMake(60, 284); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
    RedButton.center = CGPointMake(168, 284); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
    OtherButtonFive.center = CGPointMake(271, 284); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
    OtherButtonSix.center = CGPointMake(60, 451); OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
    OtherButtonSeven.center = CGPointMake(168, 451); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
    OtherButtonEight.center = CGPointMake(271, 451); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
    }
        
    InGameScore.text = [NSString stringWithFormat:@"%.2f", Counter];
    
    HighScore.hidden = YES;
    LastScore.hidden =YES;
    InGameScore.hidden = NO;
    Display.hidden = YES;
    Dead.hidden = YES;
    Home.hidden = YES;
    Replay.hidden = YES;
    
    if (TheBackGround == 1) {
        BackGround.image = [UIImage imageNamed:@"Forest-Snow.png"];
    } else if (TheBackGround == 2) {
        BackGround.image = [UIImage imageNamed:@"Petal-Violet.png"];
    } else if (TheBackGround == 3) {
        BackGround.image = [UIImage imageNamed:@"Petal-Orange.png"];
    } else if (TheBackGround == 4) {
        BackGround.image = [UIImage imageNamed:@"Apple-Wallpaper.png"];
    } else if (TheBackGround == 5) {
        BackGround.image = [UIImage imageNamed:@"Petal-VP.png"];
    } else if (TheBackGround == 6) {
        BackGround.image = [UIImage imageNamed:@"Petal-White.png"];
    } else if (TheBackGround == 7) {
        BackGround.image = [UIImage imageNamed:@"Night-Image.png"];
    } else if (TheBackGround == 8) {
        BackGround.image = [UIImage imageNamed:@"Yosimite.png"];
    } else if (TheBackGround == 9) {
        BackGround.image = [UIImage imageNamed:@"Petal-Purple.png"];
    } else if (TheBackGround == 10) {
        BackGround.image = [UIImage imageNamed:@"Petel-Green.png"];
    } else if (TheBackGround == 11) {
        BackGround.image = [UIImage imageNamed:@"apple.png"];
    } else if (TheBackGround == 12) {
        BackGround.image = [UIImage imageNamed:@"Blue-CreamBG.png"];
    } else if (TheBackGround == 13) {
        BackGround.image = [UIImage imageNamed:@"Blue-Green-WhiteBG.png"];
    } else if (TheBackGround == 14) {
        BackGround.image = [UIImage imageNamed:@"Blue-WhiteBG.png"];
    } else if (TheBackGround == 15) {
        BackGround.image = [UIImage imageNamed:@"ColdJaggyBG.png"];
    } else if (TheBackGround == 16) {
        BackGround.image = [UIImage imageNamed:@"DesetDarkBG.png"];
    } else if (TheBackGround == 17) {
        BackGround.image = [UIImage imageNamed:@"GrassBG.png"];
    } else if (TheBackGround == 18) {
        BackGround.image = [UIImage imageNamed:@"Green-BlueBG.png"];
    } else if (TheBackGround == 19) {
        BackGround.image = [UIImage imageNamed:@"GreenBG.png"];
    } else if (TheBackGround == 20) {
        BackGround.image = [UIImage imageNamed:@"LakeForestBG.png"];
    } else if (TheBackGround == 21) {
        BackGround.image = [UIImage imageNamed:@"MultiWaveBG.png"];
    } else if (TheBackGround == 22) {
        BackGround.image = [UIImage imageNamed:@"OrangeFlowers.png"];
    } else if (TheBackGround == 23) {
        BackGround.image = [UIImage imageNamed:@"PartyBG.png"];
    } else if (TheBackGround == 24) {
        BackGround.image = [UIImage imageNamed:@"Purple-WhiteBG.png"];
    } else if (TheBackGround == 25) {
        BackGround.image = [UIImage imageNamed:@"WarmJaggyBG.png"];
    } else if (TheBackGround == 26) {
        BackGround.image = [UIImage imageNamed:@"WaterFlowBG.png"];
    } else if (TheBackGround == 27) {
        BackGround.image = [UIImage imageNamed:@"nightimage?.png"];
    } else if (TheBackGround == 28) {
        BackGround.image = [UIImage imageNamed:@"rainforest.png"];
    } else if (TheBackGround == 29) {
        BackGround.image = [UIImage imageNamed:@"earth.png"];
    } else if (TheBackGround == 30) {
        BackGround.image = [UIImage imageNamed:@"SunDown.png"];
    } else if (TheBackGround == 31) {
        BackGround.image = [UIImage imageNamed:@"CoolBackGrond.png"];
    } else if (TheBackGround == 32) {
        BackGround.image = [UIImage imageNamed:@"BigHomeScreen.png"];
    } else if (TheBackGround == 33) {
        BackGround.image = [UIImage imageNamed:@"WaterPic.png"];
    } else if (TheBackGround == 34) {
        BackGround.image = [UIImage imageNamed:@"SplitBG.png"];
    } else if (TheBackGround == 35) {
        BackGround.image = [UIImage imageNamed:@"northenlights.png"];
    } else if (TheBackGround == 36) {
        BackGround.image = [UIImage imageNamed:@"GoldSkyBG.png"];
    }
    
    if (TheButton == 1) {
        RedButton.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        RedButton.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        RedButton.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        RedButton.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        RedButton.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        RedButton.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        RedButton.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        RedButton.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        RedButton.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        RedButton.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        RedButton.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        RedButton.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        RedButton.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        RedButton.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        RedButton.image = [UIImage imageNamed:@"White.png"];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end