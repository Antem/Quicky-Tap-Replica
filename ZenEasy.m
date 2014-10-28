//
//  ZenEasy.m
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "ZenEasy.h"
#import <GameKit/GameKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface ZenEasy ()
{
    IBOutlet UILabel *InGameCounter;
}

@end

@implementation ZenEasy

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


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

//Buttons

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
}

-(IBAction)RedButton:(id)sender
{
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
    
    ButtonPressed = ButtonPressed + 1;
    NSLog(@"Score: %i", ButtonPressed);
    [Timer invalidate];
    Timer = nil;
    [self Game];
}

-(IBAction)OtherButton:(id)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    [self EndGame];
    [Timer invalidate];
    Timer = nil;
}

//Game

-(void)Game
{
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Score) userInfo:nil repeats:YES];
    
    InGameCounter.text = [NSString stringWithFormat:@"Score: %i", ButtonPressed];
    
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
    Time = Time - 0.01;
    NSLog(@"Timer: %.2f", Time);
    InGameThing.text = [NSString stringWithFormat:@"%.2f", Time];
    
    if (Time <= 0) {
        [self EndGame];
        [Timer invalidate];
        Timer = nil;
    }
    if (Timer == nil) {
        NSLog(@"The Timer had been invalidated");
    }
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Zen_Easy_Leaderboard"];
    int64_t GameCenterScoreFour = HighScoreNum;
    score.value = GameCenterScoreFour;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)EndGame
{
    [self Fadein];
    [Timer invalidate];
    Timer = nil;
    
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    InGameCounter.hidden = YES;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    InGameThing.hidden = YES;
    
    
    if (ButtonPressed > HighScoreNum) {
        HighScoreNum = ButtonPressed;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNum forKey:@"HighScoreZenEasySaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNum];

    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    InGameCounter.hidden = YES;
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
}

- (void)viewDidLoad
{
    Time = 15;
    ButtonPressed = 0;
    
    [super viewDidLoad];
    
    HighScoreNum = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreZenEasySaved"];
    
    if (HighScoreNum == 0) {
    NSString *Zen = @"You have a 15 seconds to tap as much buttons as you can. If you tap a black button before the timer runs out, you keep the same score however the game is over.";
    UIAlertView *ZnAlert = [[UIAlertView alloc] initWithTitle:@"Zen Help" message:Zen delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [ZnAlert show];
    }
    
    HighScore.hidden = YES;
    LastScore.hidden = YES;
    InGameThing.hidden = NO;
    InGameCounter.hidden = NO;
    Display.hidden = YES;
    Home.hidden = YES;
    Replay.hidden = YES;
    DeadMessage.hidden = YES;
    
    InGameThing.text = [NSString stringWithFormat:@"%.2f", Time];
    InGameCounter.text = [NSString stringWithFormat:@"Score: %i", ButtonPressed];
    
    RedButton.hidden = NO, OtherButtonOne.hidden = NO, OtherButtonTwo.hidden = NO, OtherButtonThree.hidden = NO, OtherButtonFour.hidden = NO, OtherButtonFive.hidden = NO, OtherButtonSix.hidden = NO, OtherButtonSeven.hidden = NO, OtherButtonEight.hidden = NO, OtherButtonNine.hidden = NO, OtherButtonTen.hidden = NO, OtherButtonEleven.hidden = NO;
    
    RedTouch.hidden = NO, OtherTouchOne.hidden = NO, OtherTouchTwo.hidden = NO, OtherTouchThree.hidden = NO, OtherTouchFour.hidden = NO, OtherTouchFive.hidden = NO, OtherTouchSix.hidden = NO, OtherTouchSeven.hidden = NO, OtherTouchEight.hidden = NO, OtherTouchNine.hidden = NO, OtherTouchTen.hidden = NO, OtherTouchEleven.hidden = NO;

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
    }  else if (TheButton == 15) {
        RedButton.image = [UIImage imageNamed:@"White.png"];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
