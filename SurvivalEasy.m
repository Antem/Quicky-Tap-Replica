//
//  SurvivalEasy.m
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "SurvivalEasy.h"
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface SurvivalEasy () <UIGestureRecognizerDelegate>
{
    IBOutlet UILabel *InGameLives;
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
}

@end

@implementation SurvivalEasy

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

-(void)Red: (UITapGestureRecognizer *)Gesture
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

-(void)Black: (UITapGestureRecognizer *)Gesture
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    Lives = Lives - 1;
    [Switch invalidate];
    Switch = nil;
    [self Game];

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
            Switch = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 2:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.8 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 3:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.6 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 4:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.4 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 5:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2.2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 6:
            Switch = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 7:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 8:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.6 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 9:
            Switch= [NSTimer scheduledTimerWithTimeInterval:1.4 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        case 10:
            Switch = [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(Score) userInfo:nil repeats:NO];
            break;
        default:
            break;
    }
    
    NSLog(@"Lives are %i", Lives);
    
    if (Lives <= 0) {
        [self EndGame];
    }

    InGameScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    InGameLives.text = [NSString stringWithFormat:@"Lives: %i", Lives];
    
    Place = arc4random_uniform(9);
    
    switch (Place) {
        case 0:
            if (IDIOM == IPAD) {
                NSLog(@"IPAD");
                RedButton.center = CGPointMake(116, 227);
                OtherButtonOne.center = CGPointMake(384,227 );
                OtherButtonTwo.center = CGPointMake(652, 227);
                OtherButtonThree.center = CGPointMake(116, 585);
                OtherButtonFour.center = CGPointMake(384, 585);
                OtherButtonFive.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                RedButton.center = CGPointMake(60, 117);
                OtherButtonOne.center = CGPointMake(168, 117);
                OtherButtonTwo.center = CGPointMake(271, 117);
                OtherButtonThree.center = CGPointMake(60, 284);
                OtherButtonFour.center = CGPointMake(168, 284);
                OtherButtonFive.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 1:
            if (IDIOM == IPAD) {
                NSLog(@"IPAD");
                OtherButtonOne.center = CGPointMake(116, 227);
                RedButton.center = CGPointMake(384,227 );
                OtherButtonTwo.center = CGPointMake(652, 227);
                OtherButtonThree.center = CGPointMake(116, 585);
                OtherButtonFour.center = CGPointMake(384, 585);
                OtherButtonFive.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                RedButton.center = CGPointMake(168, 117);
                OtherButtonTwo.center = CGPointMake(271, 117);
                OtherButtonThree.center = CGPointMake(60, 284);
                OtherButtonFour.center = CGPointMake(168, 284);
                OtherButtonFive.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 2:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                RedButton.center = CGPointMake(652, 227);
                OtherButtonThree.center = CGPointMake(116, 585);
                OtherButtonFour.center = CGPointMake(384, 585);
                OtherButtonFive.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                RedButton.center = CGPointMake(271, 117);
                OtherButtonThree.center = CGPointMake(60, 284);
                OtherButtonFour.center = CGPointMake(168, 284);
                OtherButtonFive.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 3:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);
                RedButton.center = CGPointMake(116, 585);
                OtherButtonFour.center = CGPointMake(384, 585);
                OtherButtonFive.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                OtherButtonThree.center = CGPointMake(271, 117);
                RedButton.center = CGPointMake(60, 284);
                OtherButtonFour.center = CGPointMake(168, 284);
                OtherButtonFive.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 4:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);
                OtherButtonFour.center = CGPointMake(116, 585);
                RedButton.center = CGPointMake(384, 585);
                OtherButtonFive.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                OtherButtonThree.center = CGPointMake(271, 117);
                OtherButtonFour.center = CGPointMake(60, 284);
                RedButton.center = CGPointMake(168, 284);
                OtherButtonFive.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);  
            }
            break;
        case 5:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);
                OtherButtonFour.center = CGPointMake(116, 585);   
                OtherButtonFive.center = CGPointMake(384, 585);
                RedButton.center = CGPointMake(652, 585);
                OtherButtonSix.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                OtherButtonThree.center = CGPointMake(271, 117);
                OtherButtonFour.center = CGPointMake(60, 284);
                OtherButtonFive.center = CGPointMake(168, 284);
                RedButton.center = CGPointMake(271, 284);
                OtherButtonSix.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 6:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);
                OtherButtonFour.center = CGPointMake(116, 585);
                OtherButtonFive.center = CGPointMake(384, 585);
                OtherButtonSix.center = CGPointMake(652, 585);
                RedButton.center = CGPointMake(116, 904);
                OtherButtonSeven.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                OtherButtonThree.center = CGPointMake(271, 117);
                OtherButtonFour.center = CGPointMake(60, 284);
                OtherButtonFive.center = CGPointMake(168, 284);
                OtherButtonSix.center = CGPointMake(271, 284);
                RedButton.center = CGPointMake(60, 451);
                OtherButtonSeven.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 7:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);  
                OtherButtonFour.center = CGPointMake(116, 585);
                OtherButtonFive.center = CGPointMake(384, 585);
                OtherButtonSix.center = CGPointMake(652, 585);
                OtherButtonSeven.center = CGPointMake(116, 904);
                RedButton.center = CGPointMake(384, 904);
                OtherButtonEight.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);
                OtherButtonThree.center = CGPointMake(271, 117);
                OtherButtonFour.center = CGPointMake(60, 284);
                OtherButtonFive.center = CGPointMake(168, 284);
                OtherButtonSix.center = CGPointMake(271, 284);
                OtherButtonSeven.center = CGPointMake(60, 451);
                RedButton.center = CGPointMake(168, 451);
                OtherButtonEight.center = CGPointMake(271, 451);
            }
            break;
        case 8:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(116, 227);
                OtherButtonTwo.center = CGPointMake(384,227 );
                OtherButtonThree.center = CGPointMake(652, 227);
                OtherButtonFour.center = CGPointMake(116, 585);
                OtherButtonFive.center = CGPointMake(384, 585);
                OtherButtonSix.center = CGPointMake(652, 585);
                OtherButtonSeven.center = CGPointMake(116, 904);
                OtherButtonEight.center = CGPointMake(384, 904);
                RedButton.center = CGPointMake(652, 904);
            } else {
                OtherButtonOne.center = CGPointMake(60, 117);
                OtherButtonTwo.center = CGPointMake(168, 117);  
                OtherButtonThree.center = CGPointMake(271, 117);
                OtherButtonFour.center = CGPointMake(60, 284);
                OtherButtonFive.center = CGPointMake(168, 284);
                OtherButtonSix.center = CGPointMake(271, 284);
                OtherButtonSeven.center = CGPointMake(60, 451);
                OtherButtonEight.center = CGPointMake(168, 451);
                RedButton.center = CGPointMake(271, 451);
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Survival_Easy_Leaderboard"];
    int64_t GameCenterScoreSeven = HighScoreNumber;
    score.value = GameCenterScoreSeven;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)EndGame
{
    [self Fadein];
    Lives = 0;
    [Switch invalidate];
    Switch = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    HighScore.hidden = NO;
    LastScore.hidden = NO;
    Home.hidden = NO;
    Display.hidden = NO;
    Replay.hidden = NO;
    InGameScore.hidden = YES;
    InGameLives.hidden = YES;
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    
    if (ButtonPressed > HighScoreNumber) {
        HighScoreNumber = ButtonPressed;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNumber forKey:@"HighScoreSurvivalEasySaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNumber];
}

- (void)viewDidLoad
{
    UITapGestureRecognizer *BlackOne= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackOne.cancelsTouchesInView = YES;
    BlackOne.numberOfTapsRequired = 1;
    BlackOne.delegate = self;
    OtherButtonOne.userInteractionEnabled = YES;
    [OtherButtonOne addGestureRecognizer:BlackOne];
    
    UITapGestureRecognizer *Blacktwo= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Blacktwo.cancelsTouchesInView = YES;
    Blacktwo.numberOfTapsRequired = 1;
    Blacktwo.delegate = self;
    OtherButtonTwo.userInteractionEnabled = YES;
    [OtherButtonTwo addGestureRecognizer:Blacktwo];
    
    UITapGestureRecognizer *BlackThree= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackThree.cancelsTouchesInView = YES;
    BlackThree.numberOfTapsRequired = 1;
    BlackThree.delegate = self;
    OtherButtonThree.userInteractionEnabled = YES;
    [OtherButtonThree addGestureRecognizer:BlackThree];
    
    UITapGestureRecognizer *BlackFour= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFour.cancelsTouchesInView = YES;
    BlackFour.numberOfTapsRequired = 1;
    BlackFour.delegate = self;
    OtherButtonFour.userInteractionEnabled = YES;
    [OtherButtonFour addGestureRecognizer:BlackFour];
    
    UITapGestureRecognizer *Blackfive= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Blackfive.cancelsTouchesInView = YES;
    Blackfive.numberOfTapsRequired = 1;
    Blackfive.delegate = self;
    OtherButtonFive.userInteractionEnabled = YES;
    [OtherButtonFive addGestureRecognizer:Blackfive];
    
    UITapGestureRecognizer *BlackSix= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSix.cancelsTouchesInView = YES;
    BlackSix.numberOfTapsRequired = 1;
    BlackSix.delegate = self;
    OtherButtonSix.userInteractionEnabled = YES;
    [OtherButtonSix addGestureRecognizer:BlackSix];
    
    UITapGestureRecognizer *BlackSeven= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSeven.cancelsTouchesInView = YES;
    BlackSeven.numberOfTapsRequired = 1;
    BlackSeven.delegate = self;
    OtherButtonSeven.userInteractionEnabled = YES;
    [OtherButtonSeven addGestureRecognizer:BlackSeven];
    
    UITapGestureRecognizer *BlackEight= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackEight.cancelsTouchesInView = YES;
    BlackEight.numberOfTapsRequired = 1;
    BlackEight.delegate = self;
    OtherButtonEight.userInteractionEnabled = YES;
    [OtherButtonEight addGestureRecognizer:BlackEight];
    
    UITapGestureRecognizer *RedTouch= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red:)];
    RedTouch.cancelsTouchesInView = YES;
    RedTouch.numberOfTapsRequired = 1;
    RedTouch.delegate = self;
    RedButton.userInteractionEnabled = YES;
    [RedButton addGestureRecognizer:RedTouch];
    
    [super viewDidLoad];
    LevelNumber = 0;
    InGameLives.hidden = NO;
    Lives = 4;
    ButtonPressed = 0;
    
    RedButton.hidden = NO, OtherButtonOne.hidden = NO, OtherButtonTwo.hidden = NO, OtherButtonThree.hidden = NO, OtherButtonFour.hidden = NO, OtherButtonFive.hidden = NO, OtherButtonSix.hidden = NO, OtherButtonSeven.hidden = NO, OtherButtonEight.hidden = NO, OtherButtonNine.hidden = NO, OtherButtonTen.hidden = NO, OtherButtonEleven.hidden = NO;

    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSurvivalEasySaved"];
    
    if (HighScoreNumber == 0) {
        NSString *Sur = @"You are given 4 lives, and you have to tap the button as many times as you can. If you hit a black button you lose a life, until you run out of lives! If you don't tap a button fast enough, you also lose a life.";
        
        UIAlertView *SurAlert = [[UIAlertView alloc] initWithTitle:@"Survival Help" message:Sur delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [SurAlert show];
    }
    
    Display.hidden = YES;
    InGameScore.hidden = NO;
    Home.hidden = YES;
    Replay.hidden = YES;
    LastScore.hidden = YES;
    HighScore.hidden = YES;
    InGameScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    InGameLives.text = [NSString stringWithFormat:@"Lives: %i", Lives];
    
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