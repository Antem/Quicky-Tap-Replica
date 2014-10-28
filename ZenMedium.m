//
//  ZenMedium.m
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "ZenMedium.h"
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface ZenMedium ()
{
    IBOutlet UILabel *InGameCounter;
}
@end

@implementation ZenMedium

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

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
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
    
    Place = arc4random() %12;
    
    switch (Place) {
        case 1:
            if (IDIOM == IPAD) {
                RedButton.center = CGPointMake(96, 207); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonOne.center = CGPointMake(384, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(672, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(96, 446); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(672, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(60, 110); RedTouch.center = CGPointMake(60, 110);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 2:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                RedButton.center = CGPointMake(384, 207); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonTwo.center = CGPointMake(672, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(96, 446); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(672, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(163, 110); RedTouch.center = CGPointMake(163, 110);
            OtherButtonOne.center = CGPointMake(60, 110); OtherTouchOne.center = CGPointMake(60, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 3:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                RedButton.center = CGPointMake(672, 207); RedTouch.center = CGPointMake (672, 207);
                NSLog(@"It corinates is: %f", RedButton.center.x);
                OtherButtonThree.center = CGPointMake(96, 446); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(384, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(672, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(265, 110); RedTouch.center = CGPointMake(265, 110);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(60, 110);OtherTouchTwo.center = CGPointMake(60, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 4:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                RedButton.center = CGPointMake(96, 446); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonFour.center = CGPointMake(384, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(672, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(60, 230); RedTouch.center = CGPointMake(60, 230);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 110);OtherTouchThree.center = CGPointMake(60, 110);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 5:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                RedButton.center = CGPointMake(384, 446); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonFive.center = CGPointMake(672, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(163, 230); RedTouch.center = CGPointMake(163, 230);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(60, 110);OtherTouchFour.center = CGPointMake(60, 110);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 6:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                RedButton.center = CGPointMake(672, 446); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonSix.center = CGPointMake(96, 685);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(265, 230); RedTouch.center = CGPointMake(265, 230);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(60, 110);OtherTouchFive.center = CGPointMake(60, 110);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 7:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                RedButton.center = CGPointMake(96, 685); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonSeven.center = CGPointMake(384, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(60, 350); RedTouch.center = CGPointMake(60, 350);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 110);OtherTouchSix.center = CGPointMake(60, 110);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 8:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(96, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                RedButton.center = CGPointMake(384, 685); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonEight.center = CGPointMake(672, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(163, 350); RedTouch.center = CGPointMake(163, 350);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(60, 110);OtherTouchSeven.center = CGPointMake(60, 110);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 9:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(96, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(384, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                RedButton.center = CGPointMake(672, 685); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonNine.center = CGPointMake(96, 924); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(265, 350); RedTouch.center = CGPointMake(265, 350);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(60, 110);OtherTouchEight.center = CGPointMake(60, 110);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 10:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(96, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(384, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(672, 685); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                RedButton.center = CGPointMake(96, 924); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonTen.center = CGPointMake(384, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(60, 470); RedTouch.center = CGPointMake(60, 470);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 110);OtherTouchNine.center = CGPointMake(60, 110);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 11:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(96, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(384, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(672, 685); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(96, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                RedButton.center = CGPointMake(384, 924); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
                OtherButtonEleven.center = CGPointMake(672, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
            } else {
            RedButton.center = CGPointMake(163, 470); RedTouch.center = CGPointMake(163, 470);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(60, 110);OtherTouchTen.center = CGPointMake(60, 110);
            OtherButtonEleven.center = CGPointMake(265, 470);OtherTouchEleven.center = CGPointMake(265, 470);
            }
            break;
        case 12:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207); OtherTouchOne.center = CGPointMake(OtherButtonOne.center.x, OtherButtonOne.center.y);
                OtherButtonTwo.center = CGPointMake(384, 207); OtherTouchTwo.center = CGPointMake(OtherButtonTwo.center.x, OtherButtonTwo.center.y);
                OtherButtonThree.center = CGPointMake(672, 207); OtherTouchThree.center = CGPointMake(OtherButtonThree.center.x, OtherButtonThree.center.y);
                OtherButtonFour.center = CGPointMake(96, 446); OtherTouchFour.center = CGPointMake(OtherButtonFour.center.x, OtherButtonFour.center.y);
                OtherButtonFive.center = CGPointMake(384, 446); OtherTouchFive.center = CGPointMake(OtherButtonFive.center.x, OtherButtonFive.center.y);
                OtherButtonSix.center = CGPointMake(672, 446);  OtherTouchSix.center = CGPointMake(OtherButtonSix.center.x, OtherButtonSix.center.y);
                OtherButtonSeven.center = CGPointMake(96, 685); OtherTouchSeven.center = CGPointMake(OtherButtonSeven.center.x, OtherButtonSeven.center.y);
                OtherButtonEight.center = CGPointMake(384, 685); OtherTouchEight.center = CGPointMake(OtherButtonEight.center.x, OtherButtonEight.center.y);
                OtherButtonNine.center = CGPointMake(672, 685); OtherTouchNine.center = CGPointMake(OtherButtonNine.center.x, OtherButtonNine.center.y);
                OtherButtonTen.center = CGPointMake(96, 924); OtherTouchTen.center = CGPointMake(OtherButtonTen.center.x, OtherButtonTen.center.y);
                OtherButtonEleven.center = CGPointMake(384, 924); OtherTouchEleven.center = CGPointMake(OtherButtonEleven.center.x, OtherButtonEleven.center.y);
                RedButton.center = CGPointMake(672, 924); RedTouch.center = CGPointMake (RedButton.center.x, RedButton.center.y);
            } else {
            RedButton.center = CGPointMake(265, 470); RedTouch.center = CGPointMake(265, 470);
            OtherButtonOne.center = CGPointMake(163, 110); OtherTouchOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);OtherTouchTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);OtherTouchThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);OtherTouchFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);OtherTouchFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);OtherTouchSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);OtherTouchSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);OtherTouchEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);OtherTouchNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);OtherTouchTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(60, 110);OtherTouchEleven.center = CGPointMake(60, 110);
            }
            break;
        default:
            break;
    }
}

-(void)Score
{
    Time = Time - 0.01;
    NSLog(@"Time: %.2f", Time);
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Zen_Medium_Leaderboard"];
    int64_t GameCenterScoreFive = HighScoreNum;
    score.value = GameCenterScoreFive;
    
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
    InGameCounter.hidden = YES;
    Replay.hidden = NO;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    InGameThing.hidden = YES;
    
    
    if (ButtonPressed > HighScoreNum) {
        HighScoreNum = ButtonPressed;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNum forKey:@"HighScoreZenMediumSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNum];
    
    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
}

- (void)viewDidLoad
{
    Time = 30;
    ButtonPressed = 0;
    
    [super viewDidLoad];
    HighScoreNum = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreZenMediumSaved"];
    
    if (HighScoreNum == 0) {
        NSString *Zen = @"You have a 30 seconds to tap as much buttons as you can. If you tap a black button before the timer runs out, you keep the same score however the game is over.";
        UIAlertView *ZnAlert = [[UIAlertView alloc] initWithTitle:@"Zen Help" message:Zen delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [ZnAlert show];
    }
    
    HighScore.hidden = YES;
    LastScore.hidden = YES;
    InGameThing.hidden = NO;
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
    } else if (TheButton == 15) {
        RedButton.image = [UIImage imageNamed:@"White.png"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
