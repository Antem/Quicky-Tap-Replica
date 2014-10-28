//
//  TransferMedium.m
//  Quicky Tap
//
//  Created by Michael Mooney on 05/08/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "TransferMedium.h"
#import "Info Page.h"
#import <AVFoundation/AVFoundation.h>
#import <GameKit/GameKit.h>
#import <AudioToolbox/AudioToolbox.h>
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

int Place;
int ScoreOne, ScoreTow;
double Counter;
NSInteger HighScoreNumber;

@interface TransferMedium ()
{
    IBOutlet UIImageView *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *RedButton, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display;
    IBOutlet UILabel *InGameSocre, *HighScore, *LastScore;
    IBOutlet UIImageView *BackGround;
    NSTimer *Timer;
}

@end

@implementation TransferMedium

-(void)Red:(UITapGestureRecognizer *)sender
{
    [Timer invalidate];
    Timer = nil;
    ScoreOne = ScoreOne + 1;
    if (ScoreOne >= 14) {
        ScoreTow = ScoreTow + 1;
        ScoreOne = 0;
        Counter = 7;
    }
    
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
    
    [self Game];
}

-(void)Black: (UITapGestureRecognizer *)sender
{
    [self EndGame];
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)Game
{
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
    
    Place = arc4random() %12;
    
    switch (Place) {
        case 1:
            if (IDIOM == IPAD) {
                RedButton.center = CGPointMake(96, 207);
                OtherButtonOne.center = CGPointMake(384, 207);
                OtherButtonTwo.center = CGPointMake(672, 207);
                OtherButtonThree.center = CGPointMake(96, 446);
                OtherButtonFour.center = CGPointMake(384, 446);
                OtherButtonFive.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(60, 110);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 2:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                RedButton.center = CGPointMake(384, 207);
                OtherButtonTwo.center = CGPointMake(672, 207);
                OtherButtonThree.center = CGPointMake(96, 446);
                OtherButtonFour.center = CGPointMake(384, 446);
                OtherButtonFive.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(163, 110);
            OtherButtonOne.center = CGPointMake(60, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 3:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                RedButton.center = CGPointMake(672, 207);
                OtherButtonThree.center = CGPointMake(96, 446);
                OtherButtonFour.center = CGPointMake(384, 446);
                OtherButtonFive.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(265, 110);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(60, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 4:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                RedButton.center = CGPointMake(96, 446);
                OtherButtonFour.center = CGPointMake(384, 446);
                OtherButtonFive.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(60, 230);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 110);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 5:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                RedButton.center = CGPointMake(384, 446);
                OtherButtonFive.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(163, 230);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(60, 110);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 6:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                RedButton.center = CGPointMake(672, 446);
                OtherButtonSix.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(265, 230);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(60, 110);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 7:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                RedButton.center = CGPointMake(96, 685);
                OtherButtonSeven.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(60, 350);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);  
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 110);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 8:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                OtherButtonSeven.center = CGPointMake(96, 685);
                RedButton.center = CGPointMake(384, 685);
                OtherButtonEight.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(163, 350);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(60, 110);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 9:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                OtherButtonSeven.center = CGPointMake(96, 685);
                OtherButtonEight.center = CGPointMake(384, 685);
                RedButton.center = CGPointMake(672, 685);
                OtherButtonNine.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(265, 350);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(60, 110);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 10:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                OtherButtonSeven.center = CGPointMake(96, 685);
                OtherButtonEight.center = CGPointMake(384, 685);
                OtherButtonNine.center = CGPointMake(672, 685);
                RedButton.center = CGPointMake(96, 924);
                OtherButtonTen.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(60, 470);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 110);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 11:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                OtherButtonSeven.center = CGPointMake(96, 685);
                OtherButtonEight.center = CGPointMake(384, 685);
                OtherButtonNine.center = CGPointMake(672, 685);
                OtherButtonTen.center = CGPointMake(96, 924);
                RedButton.center = CGPointMake(384, 924);
                OtherButtonEleven.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(163, 470);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(60, 110);
            OtherButtonEleven.center = CGPointMake(265, 470);
            }
            break;
        case 12:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(96, 207);
                OtherButtonTwo.center = CGPointMake(384, 207);
                OtherButtonThree.center = CGPointMake(672, 207);
                OtherButtonFour.center = CGPointMake(96, 446);
                OtherButtonFive.center = CGPointMake(384, 446);
                OtherButtonSix.center = CGPointMake(672, 446);
                OtherButtonSeven.center = CGPointMake(96, 685);
                OtherButtonEight.center = CGPointMake(384, 685);
                OtherButtonNine.center = CGPointMake(672, 685);
                OtherButtonTen.center = CGPointMake(96, 924);
                OtherButtonEleven.center = CGPointMake(384, 924);
                RedButton.center = CGPointMake(672, 924);
            } else {
            RedButton.center = CGPointMake(265, 470);
            OtherButtonOne.center = CGPointMake(163, 110);
            OtherButtonTwo.center = CGPointMake(265, 110);
            OtherButtonThree.center = CGPointMake(60, 230);
            OtherButtonFour.center = CGPointMake(163, 230);
            OtherButtonFive.center = CGPointMake(265, 230);
            OtherButtonSix.center = CGPointMake(60, 350);
            OtherButtonSeven.center = CGPointMake(163, 350);
            OtherButtonEight.center = CGPointMake(265, 350);
            OtherButtonNine.center = CGPointMake(60, 470);
            OtherButtonTen.center = CGPointMake(163, 470);
            OtherButtonEleven.center = CGPointMake(60, 110);
            }
            break;
        default:
            break;
    }
}


-(void)Counter
{
    Counter = Counter - 0.01;
    NSLog(@"The Counter: %.2f", Counter);
    InGameSocre.text = [NSString stringWithFormat:@"%.2f", Counter];
    if (Counter < 0) {
        [self EndGame];
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Transfer_Medium_Leaderboard"];
    int64_t GameCenterScoreSeventeen = HighScoreNumber;
    score.value = GameCenterScoreSeventeen;
    
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
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    
    RedButton.hidden = YES;
    OtherButtonOne.hidden = YES;
    OtherButtonTwo.hidden = YES;
    OtherButtonThree.hidden = YES;
    OtherButtonFour.hidden = YES;
    OtherButtonFive.hidden = YES;
    OtherButtonSix.hidden = YES;
    OtherButtonSeven.hidden = YES;
    OtherButtonEight.hidden = YES;
    OtherButtonNine.hidden = YES;
    OtherButtonTen.hidden = YES;
    OtherButtonEleven.hidden = YES;
    InGameSocre.hidden = YES;
    
    Replay.hidden = NO;
    Home.hidden = NO;
    Display.hidden = NO;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    
    if (ScoreTow >= 1) {
        ScoreOne = ScoreOne + (ScoreTow * 14);
    }
    
    if (ScoreOne > HighScoreNumber) {
        HighScoreNumber = ScoreOne;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNumber forKey:@"TransferEasyHighScoreSaved"];
    }
    [self reportScore];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNumber];
    LastScore.text = [NSString stringWithFormat:@"%i", ScoreOne];
}

- (void)viewDidLoad
{
    Counter  = 7;
    ScoreOne = 0;
    ScoreTow = 0;
    
    InGameSocre.text = [NSString stringWithFormat:@"%.2f", Counter];
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"TransferEasyHighScoreSaved"];
    
    if (HighScoreNumber == 0) {
        NSString *Trans = @"You are given 7 seconds, to tap 14 of buttons. If you don't tap the buttons fast enough, the game will be over. However if you do tap all the buttons in time, the timer will restart.";
        
        UIAlertView *TransAlert = [[UIAlertView alloc] initWithTitle:@"Transfer Help" message:Trans delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [TransAlert show];
    }
    
    Display.hidden = YES;
    HighScore.hidden = YES;
    Home.hidden = YES;
    Replay.hidden = YES;
    LastScore.hidden = YES;
    
    UITapGestureRecognizer *BlackOne= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackOne.cancelsTouchesInView = YES;
    BlackOne.numberOfTapsRequired = 1;
    OtherButtonOne.userInteractionEnabled = YES;
    [OtherButtonOne addGestureRecognizer:BlackOne];
    
    UITapGestureRecognizer *Blacktwo= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Blacktwo.cancelsTouchesInView = YES;
    Blacktwo.numberOfTapsRequired = 1;
    OtherButtonTwo.userInteractionEnabled = YES;
    [OtherButtonTwo addGestureRecognizer:Blacktwo];
    
    UITapGestureRecognizer *BlackThree= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackThree.cancelsTouchesInView = YES;
    BlackThree.numberOfTapsRequired = 1;
    OtherButtonThree.userInteractionEnabled = YES;
    [OtherButtonThree addGestureRecognizer:BlackThree];
    
    UITapGestureRecognizer *BlackFour= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFour.cancelsTouchesInView = YES;
    BlackFour.numberOfTapsRequired = 1;
    OtherButtonFour.userInteractionEnabled = YES;
    [OtherButtonFour addGestureRecognizer:BlackFour];
    
    UITapGestureRecognizer *Blackfive= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Blackfive.cancelsTouchesInView = YES;
    Blackfive.numberOfTapsRequired = 1;
    OtherButtonFive.userInteractionEnabled = YES;
    [OtherButtonFive addGestureRecognizer:Blackfive];
    
    UITapGestureRecognizer *BlackSix= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSix.cancelsTouchesInView = YES;
    BlackSix.numberOfTapsRequired = 1;
    OtherButtonSix.userInteractionEnabled = YES;
    [OtherButtonSix addGestureRecognizer:BlackSix];
    
    UITapGestureRecognizer *BlackSeven= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSeven.cancelsTouchesInView = YES;
    BlackSeven.numberOfTapsRequired = 1;
    OtherButtonSeven.userInteractionEnabled = YES;
    [OtherButtonSeven addGestureRecognizer:BlackSeven];
    
    UITapGestureRecognizer *BlackEight= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackEight.cancelsTouchesInView = YES;
    BlackEight.numberOfTapsRequired = 1;
    OtherButtonEight.userInteractionEnabled = YES;
    [OtherButtonEight addGestureRecognizer:BlackEight];
    
    UITapGestureRecognizer *RedTouch= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red:)];
    RedTouch.cancelsTouchesInView = YES;
    RedTouch.numberOfTapsRequired = 1;
    RedButton.userInteractionEnabled = YES;
    [RedButton addGestureRecognizer:RedTouch];
    
    UITapGestureRecognizer *BlackNine= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackNine.cancelsTouchesInView = YES;
    BlackNine.numberOfTapsRequired = 1;
    OtherButtonNine.userInteractionEnabled = YES;
    [OtherButtonNine addGestureRecognizer:BlackNine];
    
    UITapGestureRecognizer *BlackTen= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackTen.cancelsTouchesInView = YES;
    BlackTen.numberOfTapsRequired = 1;
    OtherButtonTen.userInteractionEnabled = YES;
    [OtherButtonTen addGestureRecognizer:BlackTen];
    
    UITapGestureRecognizer *BlackEleven= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackEleven.cancelsTouchesInView = YES;
    BlackEleven.numberOfTapsRequired = 1;
    OtherButtonEleven.userInteractionEnabled = YES;
    [OtherButtonEleven addGestureRecognizer:BlackEleven];
    
    [super viewDidLoad];
    
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
    // Dispose of any resources that can be recreated.
}

@end
