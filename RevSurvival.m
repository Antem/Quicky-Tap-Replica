//
//  RevSurvival.m
//  Quicky Tap
//
//  Created by Michael Mooney on 01/08/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "RevSurvival.h"
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface RevSurvival ()
{
    IBOutlet UIImageView *BackGround;
    IBOutlet UILabel *InGameLives;
}
@end

@implementation RevSurvival

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
    [Switch invalidate];
    Switch = nil;
    [self Game];
}

-(IBAction)OtherButton:(id)sender
{
    Lives = Lives - 1;
    [Switch invalidate];
    Switch = nil;
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    [self Game];
}

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
}

//The Game

-(void)Game
{
    if (ButtonPressed > 0 && ButtonPressed < 10) {
        LevelNumber = 1;
    }
    if (ButtonPressed > 10 && ButtonPressed < 15) {
        LevelNumber = 2;
    }
    if (ButtonPressed > 20 && ButtonPressed < 25) {
        LevelNumber = 3;
    }
    if (ButtonPressed > 25 && ButtonPressed < 30) {
        LevelNumber = 4;
    }
    if (ButtonPressed > 30 && ButtonPressed < 35) {
        LevelNumber = 5;
    }
    if (ButtonPressed > 35 && ButtonPressed < 40) {
        LevelNumber = 6;
    }
    if (ButtonPressed > 40 && ButtonPressed < 45) {
        LevelNumber = 7;
    }
    if (ButtonPressed > 45 && ButtonPressed < 50) {
        LevelNumber = 8;
    }
    if (ButtonPressed > 50 && ButtonPressed < 55) {
        LevelNumber = 9;
    }
    if (ButtonPressed > 55) {
        LevelNumber = 10;
    }
    
    switch (LevelNumber) {
        case 1:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.6 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 2:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.4 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 3:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 4:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 5:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 6:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.6 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 7:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.4 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 8:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 9:
            Switch= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 10:
            Switch = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        default:
            break;
    }
    
    if (Lives == 0) {
        [self EndGame];
    }
    
    InGameScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    InGameLives.text = [NSString stringWithFormat:@"Lives: %i", Lives];
    
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
    Lives = Lives - 1;
    if (Lives < 0) {
        [Switch invalidate];
        Switch = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        Lives = 0;
    }
    NSLog(@"Lives: %i", Lives);
    [self Game];
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"RevSurvival_Leaderboard"];
    int64_t GameCenterScoreFithteen = ButtonPressed;
    score.value = GameCenterScoreFithteen;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)EndGame
{
    [self Fadein];
    [Switch invalidate];
    Switch = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    HighScore.hidden = NO;
    LastScore.hidden = NO;
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    InGameScore.hidden = YES;
    InGameLives.hidden = YES;
    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
    
    if (ButtonPressed > HighScoreNumber) {
        HighScoreNumber = ButtonPressed;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNumber forKey:@"HighScoreSurvivalMediumSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNumber];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Lives = 2;
    ButtonPressed = 0;
    
    RedButton.hidden = NO, OtherButtonOne.hidden = NO, OtherButtonTwo.hidden = NO, OtherButtonThree.hidden = NO, OtherButtonFour.hidden = NO, OtherButtonFive.hidden = NO, OtherButtonSix.hidden = NO, OtherButtonSeven.hidden = NO, OtherButtonEight.hidden = NO, OtherButtonNine.hidden = NO, OtherButtonTen.hidden = NO, OtherButtonEleven.hidden = NO;
    
    RedTouch.hidden = NO, OtherTouchOne.hidden = NO, OtherTouchTwo.hidden = NO, OtherTouchThree.hidden = NO, OtherTouchFour.hidden = NO, OtherTouchFive.hidden = NO, OtherTouchSix.hidden = NO, OtherTouchSeven.hidden = NO, OtherTouchEight.hidden = NO, OtherTouchNine.hidden = NO, OtherTouchTen.hidden = NO, OtherTouchEleven.hidden = NO;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSurvivalMediumSaved"];
    
    if (HighScoreNumber == 0) {
        NSString *Rev = @"You have to tap the black this time. If you tap your selected button, the game will be over. This game mode is exactly the same as survival medium, but reverse!!";
        
        UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Reverse Help" message:Rev delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [RevAlert show];
    }
    
    Display.hidden = YES;
    InGameScore.hidden = NO;
    Home.hidden = YES;
    Replay.hidden = YES;
    LastScore.hidden = YES;
    HighScore.hidden = YES;
    
    InGameScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    InGameLives.text = [NSString stringWithFormat:@"Lives: %i", Lives];
    
    if (TheButton == 1) {
        OtherButtonOne.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"RedButton.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        OtherButtonOne.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        OtherButtonOne.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Pink.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        OtherButtonOne.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Green.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        OtherButtonOne.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        OtherButtonOne.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Brown.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        OtherButtonOne.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Purple.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        OtherButtonOne.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Blue.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        OtherButtonOne.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        OtherButtonOne.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        OtherButtonOne.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Cyan.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        OtherButtonOne.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        OtherButtonOne.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Lime.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        OtherButtonOne.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"Violet.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        OtherButtonOne.image = [UIImage imageNamed:@"White.png"];
        OtherButtonTwo.image = [UIImage imageNamed:@"White.png"];
        OtherButtonThree.image = [UIImage imageNamed:@"White.png"];
        OtherButtonFour.image = [UIImage imageNamed:@"White.png"];
        OtherButtonFive.image= [UIImage imageNamed:@"White.png"];
        OtherButtonSix.image = [UIImage imageNamed:@"White.png"];
        OtherButtonSeven.image = [UIImage imageNamed:@"White.png"];
        OtherButtonEight.image = [UIImage imageNamed:@"White.png"];
        OtherButtonNine.image = [UIImage imageNamed:@"White.png"];
        OtherButtonTen.image = [UIImage imageNamed:@"White.png"];
        OtherButtonEleven.image = [UIImage imageNamed:@"White.png"];
    }
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end