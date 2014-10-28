//
//  DuoZen.m
//  Quicky Tap
//
//  Created by Michael Mooney on 19/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "DuoZen.h"
#import "Info Page.h"
#import <AudioToolbox/AudioToolbox.h>
#define degreesToRadian(x) (M_PI * (x) / 180.0)

int ScoreOne, ScoreTwo;
int PlaceOne, PlaceTwo;
double CounterOne, CounterTwo;
BOOL One, Two, DOne, DTwo;

@interface DuoZen ()
{
    IBOutlet UIButton *ReplayOne, *HomeOne, *ReplayTwo, *HomeTwo;
    IBOutlet UIImageView *ObjectOneOne, *ObjectTwoOne, *ObjectThreeOne, *ObjectFourOne, *ObjectFiveOne, *ObjectSixOne, *ObjectSevenOne, *ObjectEightOne, *ObjectNineOne, *ObjectTenOne, *ObjectElevenOne, *ObjectRedOne;
    IBOutlet UIImageView *ObjectOneTwo, *ObjectTwoTwo, *ObjectThreeTwo, *ObjectFourTwo, *ObjectFiveTwo, *ObjectSixTwo, *ObjectSevenTwo, *ObjectEightTwo, *ObjectNineTwo, *ObjectTenTwo, *ObjectElevenTwo, *ObjectRedTwo;
    IBOutlet UILabel *InGameScoreOne, *InGameScoreTwo;
    IBOutlet UILabel *InGameScounterOne, *InGameCounterTwo;
    IBOutlet UIImageView *DisplayOne, *DisplayTwo;
    IBOutlet UILabel *PlayerOneOne, *PlayerOneTwo, *PlayerTwoOne, *PlayerTwoTwo;
    IBOutlet UILabel *P1, *P2;
    IBOutlet UILabel *PlayerOneWiat, *PlayerTwoWait;
    IBOutlet UIImageView *DeadOne, *DeadTwo;
    IBOutlet UIImageView *BackGround, *BackGroundTwo;
    NSTimer *PlayerOne, *PlayerTwo;
}
@end

@implementation DuoZen

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)TapOne:(UITapGestureRecognizer *)sender
{
    ScoreOne = ScoreOne + 1;
    InGameScoreOne.text = [NSString stringWithFormat:@"Score: %i", ScoreOne];

    [PlayerOne invalidate];
    self->PlayerOne = nil;
    
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
    [self GameOne];
}

-(void)TapTwo:(UITapGestureRecognizer *)sender
{
    ScoreTwo = ScoreTwo + 1;
    InGameScoreTwo.text = [NSString stringWithFormat:@"Score: %i", ScoreTwo];
    
    [PlayerTwo invalidate];
    self->PlayerTwo = nil;
    
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
    [self GameTwo];
}

-(void)BlackOne:(UITapGestureRecognizer *)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    One = YES;
    [self EndGame];
}

-(void)BlackTwo:(UITapGestureRecognizer *)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    Two = YES;
    [self EndGame];
}

-(void)GameOne
{
    PlayerOne = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(CounterOne) userInfo:nil repeats:YES];
    PlaceOne = arc4random_uniform(12);
    
    switch (PlaceOne) {
        case 1:
            ObjectRedOne.center = CGPointMake(132, 74);
            ObjectOneOne.center = CGPointMake(295, 74);
            ObjectTwoOne.center = CGPointMake(458, 74);
            ObjectThreeOne.center = CGPointMake(622, 74);
            
            ObjectFourOne.center = CGPointMake(132, 231);
            ObjectFiveOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 2:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectRedOne.center = CGPointMake(295, 74);
            ObjectTwoOne.center = CGPointMake(458, 74);
            ObjectThreeOne.center = CGPointMake(622, 74);
            
            ObjectFourOne.center = CGPointMake(132, 231);
            ObjectFiveOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 3:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectRedOne.center = CGPointMake(458, 74);
            ObjectThreeOne.center = CGPointMake(622, 74);
            
            ObjectFourOne.center = CGPointMake(132, 231);
            ObjectFiveOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 4:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectRedOne.center = CGPointMake(622, 74);
            
            ObjectFourOne.center = CGPointMake(132, 231);
            ObjectFiveOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 5:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectRedOne.center = CGPointMake(132, 231);
            ObjectFiveOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 6:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectRedOne.center = CGPointMake(295, 231);
            ObjectSixOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 7:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectRedOne.center = CGPointMake(458, 231);
            ObjectSevenOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 8:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectSevenOne.center = CGPointMake(458, 231);
            ObjectRedOne.center = CGPointMake(622, 231);
            
            ObjectEightOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 9:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectSevenOne.center = CGPointMake(458, 231);
            ObjectEightOne.center = CGPointMake(622, 231);
            
            ObjectRedOne.center = CGPointMake(132, 388);
            ObjectNineOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 10:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectSevenOne.center = CGPointMake(458, 231);
            ObjectEightOne.center = CGPointMake(622, 231);
            
            ObjectNineOne.center = CGPointMake(132, 388);
            ObjectRedOne.center = CGPointMake(295, 388);
            ObjectTenOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 11:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectSevenOne.center = CGPointMake(458, 231);
            ObjectEightOne.center = CGPointMake(622, 231);
            
            ObjectNineOne.center = CGPointMake(132, 388);
            ObjectTenOne.center = CGPointMake(295, 388);
            ObjectRedOne.center = CGPointMake(458, 388);
            ObjectElevenOne.center = CGPointMake(622, 388);
            break;
        case 12:
            ObjectOneOne.center = CGPointMake(132, 74);
            ObjectTwoOne.center = CGPointMake(295, 74);
            ObjectThreeOne.center = CGPointMake(458, 74);
            ObjectFourOne.center = CGPointMake(622, 74);
            
            ObjectFiveOne.center = CGPointMake(132, 231);
            ObjectSixOne.center = CGPointMake(295, 231);
            ObjectSevenOne.center = CGPointMake(458, 231);
            ObjectEightOne.center = CGPointMake(622, 231);
            
            ObjectNineOne.center = CGPointMake(132, 388);
            ObjectTenOne.center = CGPointMake(295, 388);
            ObjectElevenOne.center = CGPointMake(458, 388);
            ObjectRedOne.center = CGPointMake(622, 388);
            break;
        default:
            break;
    }
}

-(void)GameTwo
{
    PlayerTwo = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(CounterTwo) userInfo:nil repeats:YES];
    PlaceTwo = arc4random_uniform(12);
    
    switch (PlaceTwo) {
        case 1:
            ObjectRedTwo.center = CGPointMake(132, 654);
            ObjectOneTwo.center = CGPointMake(295, 654);
            ObjectTwoTwo.center = CGPointMake(458, 654);
            ObjectThreeTwo.center = CGPointMake(622, 654);
            
            ObjectFourTwo.center = CGPointMake(132, 811);
            ObjectFiveTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 2:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectRedTwo.center = CGPointMake(295, 654);
            ObjectTwoTwo.center = CGPointMake(458, 654);
            ObjectThreeTwo.center = CGPointMake(622, 654);
            
            ObjectFourTwo.center = CGPointMake(132, 811);
            ObjectFiveTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 3:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectRedTwo.center = CGPointMake(458, 654);
            ObjectThreeTwo.center = CGPointMake(622, 654);
            
            ObjectFourTwo.center = CGPointMake(132, 811);
            ObjectFiveTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 4:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectRedTwo.center = CGPointMake(622, 654);
            
            ObjectFourTwo.center = CGPointMake(132, 811);
            ObjectFiveTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 5:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectRedTwo.center = CGPointMake(132, 811);
            ObjectFiveTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 6:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectRedTwo.center = CGPointMake(295, 811);
            ObjectSixTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 7:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectRedTwo.center = CGPointMake(458, 811);
            ObjectSevenTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 8:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectSevenTwo.center = CGPointMake(458, 811);
            ObjectRedTwo.center = CGPointMake(622, 811);
            
            ObjectEightTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 9:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectSevenTwo.center = CGPointMake(458, 811);
            ObjectEightTwo.center = CGPointMake(622, 811);
            
            ObjectRedTwo.center = CGPointMake(132, 968);
            ObjectNineTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 10:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectSevenTwo.center = CGPointMake(458, 811);
            ObjectEightTwo.center = CGPointMake(622, 811);
            
            ObjectNineTwo.center = CGPointMake(132, 968);
            ObjectRedTwo.center = CGPointMake(295, 968);
            ObjectTenTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 11:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectSevenTwo.center = CGPointMake(458, 811);
            ObjectEightTwo.center = CGPointMake(622, 811);
            
            ObjectNineTwo.center = CGPointMake(132, 968);
            ObjectTenTwo.center = CGPointMake(295, 968);
            ObjectRedTwo.center = CGPointMake(458, 968);
            ObjectElevenTwo.center = CGPointMake(622, 968);
            break;
        case 12:
            ObjectOneTwo.center = CGPointMake(132, 654);
            ObjectTwoTwo.center = CGPointMake(295, 654);
            ObjectThreeTwo.center = CGPointMake(458, 654);
            ObjectFourTwo.center = CGPointMake(622, 654);
            
            ObjectFiveTwo.center = CGPointMake(132, 811);
            ObjectSixTwo.center = CGPointMake(295, 811);
            ObjectSevenTwo.center = CGPointMake(458, 811);
            ObjectEightTwo.center = CGPointMake(622, 811);
            
            ObjectNineTwo.center = CGPointMake(132, 968);
            ObjectTenTwo.center = CGPointMake(295, 968);
            ObjectElevenTwo.center = CGPointMake(458, 968);
            ObjectRedTwo.center = CGPointMake(622, 968);
            break;
        default:
            break;
    }
}

-(void)CounterOne
{
    CounterOne = CounterOne - 0.01;
    InGameScounterOne.text = [NSString stringWithFormat:@"%.2f", CounterOne];
    if (0 > CounterOne) {
        One = YES;
        [self EndGame];
        [PlayerOne invalidate];
        self->PlayerOne = nil;
    }
}

-(void)CounterTwo
{
    CounterTwo = CounterTwo - 0.01;
    InGameCounterTwo.text = [NSString stringWithFormat:@"%.2f", CounterTwo];
    if (0 > CounterTwo) {
        Two = YES;
        [self EndGame];
        [PlayerTwo invalidate];
        self->PlayerTwo = nil;
    }
}

-(void)EndGame
{
    if (One == YES && Two == NO) {
        PlayerOneWiat.hidden = NO;
        InGameScounterOne.hidden = YES;
        InGameScoreOne.hidden = YES;
        ObjectOneOne.hidden = YES;
        ObjectTwoOne.hidden = YES;
        ObjectThreeOne.hidden = YES;
        ObjectFourOne.hidden = YES;
        ObjectFiveOne.hidden = YES;
        ObjectSixOne.hidden = YES;
        ObjectSevenOne.hidden = YES;
        ObjectEightOne.hidden = YES;
        ObjectNineOne.hidden = YES;
        ObjectTenOne.hidden = YES;
        ObjectElevenOne.hidden = YES;
        ObjectRedOne.hidden = YES;
    } else if (One == NO && Two == YES) {
        PlayerTwoWait.hidden = NO;
        InGameCounterTwo.hidden = YES;
        InGameScoreTwo.hidden = YES;
        ObjectOneTwo.hidden = YES;
        ObjectTwoTwo.hidden = YES;
        ObjectThreeTwo.hidden = YES;
        ObjectFourTwo.hidden = YES;
        ObjectFiveTwo.hidden = YES;
        ObjectSixTwo.hidden = YES;
        ObjectSevenTwo.hidden = YES;
        ObjectEightTwo.hidden = YES;
        ObjectNineTwo.hidden = YES;
        ObjectTenTwo.hidden = YES;
        ObjectElevenTwo.hidden = YES;
        ObjectRedTwo.hidden = YES;
    } else if (One == YES && Two == YES) {
        [PlayerOne invalidate];
        self->PlayerOne = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        [PlayerTwo invalidate];
        self->PlayerTwo = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        [self Compare];
    }
}

-(void)Compare
{
    PlayerOneWiat.hidden = YES;
    PlayerTwoWait.hidden = YES;
    InGameScounterOne.hidden = YES;
    InGameScoreOne.hidden = YES;
    ObjectOneOne.hidden = YES;
    ObjectTwoOne.hidden = YES;
    ObjectThreeOne.hidden = YES;
    ObjectFourOne.hidden = YES;
    ObjectFiveOne.hidden = YES;
    ObjectSixOne.hidden = YES;
    ObjectSevenOne.hidden = YES;
    ObjectEightOne.hidden = YES;
    ObjectNineOne.hidden = YES;
    ObjectTenOne.hidden = YES;
    ObjectElevenOne.hidden = YES;
    ObjectRedOne.hidden = YES;
    InGameCounterTwo.hidden = YES;
    InGameScoreTwo.hidden = YES;
    ObjectOneTwo.hidden = YES;
    ObjectTwoTwo.hidden = YES;
    ObjectThreeTwo.hidden = YES;
    ObjectFourTwo.hidden = YES;
    ObjectFiveTwo.hidden = YES;
    ObjectSixTwo.hidden = YES;
    ObjectSevenTwo.hidden = YES;
    ObjectEightTwo.hidden = YES;
    ObjectNineTwo.hidden = YES;
    ObjectTenTwo.hidden = YES;
    ObjectElevenTwo.hidden = YES;
    ObjectRedTwo.hidden = YES;
    DeadOne.hidden = YES;
    DeadTwo.hidden = YES;
    
    DisplayOne.hidden = NO;
    DisplayTwo.hidden = NO;
    PlayerOneOne.hidden = NO;
    PlayerOneTwo.hidden = NO;
    PlayerTwoOne.hidden = NO;
    PlayerTwoTwo.hidden = NO;
    
    P1.hidden = YES;
    P2.hidden = YES;
    
    PlayerOneOne.text = [NSString stringWithFormat:@"%i", ScoreOne];
    PlayerOneTwo.text = [NSString stringWithFormat:@"%i", ScoreTwo];
    
    PlayerTwoOne.text = [NSString stringWithFormat:@"%i", ScoreOne];
    PlayerTwoTwo.text = [NSString stringWithFormat:@"%i", ScoreTwo];
    
    if (One == YES && DTwo == YES) {
        DisplayOne.image = [UIImage imageNamed:@"PlayerOneBlack.png"];
        DisplayTwo.image = [UIImage imageNamed:@"PlayerOneBlack.png"];
        HomeOne.hidden = NO;
        ReplayOne.hidden = NO;
        PlayerOneOne.hidden = YES;
        PlayerOneTwo.hidden = YES;
        PlayerTwoOne.hidden = YES;
        PlayerTwoTwo.hidden = YES;
    } else if (Two == YES && DOne == YES) {
        DisplayOne.image = [UIImage imageNamed:@"PlayerTwoBlack.png"];
        DisplayTwo.image = [UIImage imageNamed:@"PlayerTwoBlack.png"];
        HomeTwo.hidden = NO;
        ReplayTwo.hidden = NO;
        PlayerOneOne.hidden = YES;
        PlayerOneTwo.hidden = YES;
        PlayerTwoOne.hidden = YES;
        PlayerTwoTwo.hidden = YES;
    } else if (ScoreOne > ScoreTwo) {
        DisplayOne.image = [UIImage imageNamed:@"PlayerOneWins.png"];
        DisplayTwo.image = [UIImage imageNamed:@"PlayerOneWins.png"];
        HomeOne.hidden = NO;
        ReplayOne.hidden = NO;
    } else if (ScoreTwo > ScoreOne) {
        DisplayOne.image = [UIImage imageNamed:@"PlayerTwoWins.png"];
        DisplayTwo.image = [UIImage imageNamed:@"PlayerTwoWins.png"];
        ReplayTwo.hidden = NO;
        HomeTwo.hidden = NO;
    } else if (ScoreOne == ScoreTwo) {
        ReplayOne.hidden = NO;
        ReplayTwo.hidden = NO;
        HomeOne.hidden = NO;
        HomeTwo.hidden = NO;
        ReplayOne.hidden = NO;
        PlayerOneOne.hidden = YES;
        PlayerOneTwo.hidden = YES;
        PlayerTwoOne.hidden = YES;
        PlayerTwoTwo.hidden = YES;
        DisplayOne.image = [UIImage imageNamed:@"ItsADraw.png"];
        DisplayTwo.image = [UIImage imageNamed:@"ItsADraw.png"];
    }
}

- (void)viewDidLoad {
    
    [PlayerOne invalidate];
    self->PlayerOne = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    [PlayerTwo invalidate];
    self->PlayerTwo = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    [self Compare];
    
    ScoreOne = 0;
    ScoreTwo = 0;
    CounterOne = 25;
    CounterTwo = 25;
    
    One = NO;
    Two = NO;
    DOne = NO;
    DTwo = NO;
    
    DeadOne.hidden = YES;
    DeadTwo.hidden = YES;
    
    InGameScoreOne.text = [NSString stringWithFormat:@"Score: %i", ScoreOne];
    InGameScounterOne.text = [NSString stringWithFormat:@"%.2f", CounterOne];
    
    InGameScoreTwo.text = [NSString stringWithFormat:@"Score; %i", ScoreTwo];
    InGameCounterTwo.text = [NSString stringWithFormat:@"%.2f", CounterTwo];
    
    PlayerOneWiat.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    InGameScoreOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    InGameScounterOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    P1.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    DisplayOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    HomeOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ReplayOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    PlayerOneOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    PlayerOneTwo.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    DeadOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectOneOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectTwoOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectThreeOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectFourOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectFiveOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectSixOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectSevenOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectEightOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectNineOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectTenOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectElevenOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ObjectRedOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    BackGroundTwo.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    
    DisplayOne.hidden = YES;
    DisplayTwo.hidden = YES;
    PlayerOneOne.hidden = YES;
    PlayerOneTwo.hidden = YES;
    PlayerTwoOne.hidden = YES;
    PlayerTwoTwo.hidden = YES;
    PlayerOneWiat.hidden = YES;
    PlayerTwoWait.hidden = YES;
    
    HomeOne.hidden = YES;
    HomeTwo.hidden = YES;
    ReplayOne.hidden = YES;
    ReplayTwo.hidden = YES;
    
    UITapGestureRecognizer *TapOne= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapOne:)];
    TapOne.cancelsTouchesInView = YES;
    TapOne.numberOfTapsRequired = 1;
    ObjectRedOne.userInteractionEnabled = YES;
    [ObjectRedOne addGestureRecognizer:TapOne];
    
    UITapGestureRecognizer *TapTwo= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTwo:)];
    TapTwo.cancelsTouchesInView = YES;
    TapTwo.numberOfTapsRequired = 1;
    ObjectRedTwo.userInteractionEnabled = YES;
    [ObjectRedTwo addGestureRecognizer:TapTwo];
    
    [super viewDidLoad];
    
    UITapGestureRecognizer *BlackOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackOne.cancelsTouchesInView = YES;
    BlackOne.numberOfTapsRequired = 1;
    ObjectOneOne.userInteractionEnabled = YES;
    [ObjectOneOne addGestureRecognizer:BlackOne];
    
    UITapGestureRecognizer *BlackTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackTwo.cancelsTouchesInView = YES;
    BlackTwo.numberOfTapsRequired = 1;
    ObjectTwoOne.userInteractionEnabled = YES;
    [ObjectTwoOne addGestureRecognizer:BlackTwo];
    
    UITapGestureRecognizer *BlackThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackThree.cancelsTouchesInView = YES;
    BlackThree.numberOfTapsRequired = 1;
    ObjectThreeOne.userInteractionEnabled = YES;
    [ObjectThreeOne addGestureRecognizer:BlackThree];
    
    UITapGestureRecognizer *BlackFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackFour.cancelsTouchesInView = YES;
    BlackFour.numberOfTapsRequired = 1;
    ObjectFourOne.userInteractionEnabled = YES;
    [ObjectFourOne addGestureRecognizer:BlackFour];
    
    UITapGestureRecognizer *BlackFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackFive.cancelsTouchesInView = YES;
    BlackFive.numberOfTapsRequired = 1;
    ObjectFiveOne.userInteractionEnabled = YES;
    [ObjectFiveOne addGestureRecognizer:BlackFive];
    
    UITapGestureRecognizer *BlackSix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackSix.cancelsTouchesInView = YES;
    BlackSix.numberOfTapsRequired = 1;
    ObjectSixOne.userInteractionEnabled = YES;
    [ObjectSixOne addGestureRecognizer:BlackSix];
    
    UITapGestureRecognizer *BlackSeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackSeven.cancelsTouchesInView = YES;
    BlackSeven.numberOfTapsRequired = 1;
    ObjectSevenOne.userInteractionEnabled = YES;
    [ObjectSevenOne addGestureRecognizer:BlackSeven];
    
    UITapGestureRecognizer *BlackEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackEight.cancelsTouchesInView = YES;
    BlackEight.numberOfTapsRequired = 1;
    ObjectEightOne.userInteractionEnabled = YES;
    [ObjectEightOne addGestureRecognizer:BlackEight];
    
    UITapGestureRecognizer *BlackNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackNine.cancelsTouchesInView = YES;
    BlackNine.numberOfTapsRequired = 1;
    ObjectNineOne.userInteractionEnabled = YES;
    [ObjectNineOne addGestureRecognizer:BlackNine];
    
    UITapGestureRecognizer *BlackTen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackTen.cancelsTouchesInView = YES;
    BlackTen.numberOfTapsRequired = 1;
    ObjectTenOne.userInteractionEnabled = YES;
    [ObjectTenOne addGestureRecognizer:BlackTen];
    
    UITapGestureRecognizer *BlackEleven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackOne:)];
    BlackEleven.cancelsTouchesInView = YES;
    BlackEleven.numberOfTapsRequired = 1;
    ObjectElevenOne.userInteractionEnabled = YES;
    [ObjectElevenOne addGestureRecognizer:BlackEleven];
    
    //Other\\//Other\\//Other\\
    
    UITapGestureRecognizer *BlackTwelve = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackTwelve.cancelsTouchesInView = YES;
    BlackTwelve.numberOfTapsRequired = 1;
    ObjectOneTwo.userInteractionEnabled = YES;
    [ObjectOneTwo addGestureRecognizer:BlackTwelve];
    
    UITapGestureRecognizer *BlackThirteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackThirteen.cancelsTouchesInView = YES;
    BlackThirteen.numberOfTapsRequired = 1;
    ObjectTwoTwo.userInteractionEnabled = YES;
    [ObjectTwoTwo addGestureRecognizer:BlackThirteen];
    
    UITapGestureRecognizer *BlackFourteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackFourteen.cancelsTouchesInView = YES;
    BlackFourteen.numberOfTapsRequired = 1;
    ObjectThreeTwo.userInteractionEnabled = YES;
    [ObjectThreeTwo addGestureRecognizer:BlackFourteen];
    
    UITapGestureRecognizer *BlackFithteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackFithteen.cancelsTouchesInView = YES;
    BlackFithteen.numberOfTapsRequired = 1;
    ObjectFourTwo.userInteractionEnabled = YES;
    [ObjectFourTwo addGestureRecognizer:BlackFithteen];
    
    UITapGestureRecognizer *BlackSixteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackSixteen.cancelsTouchesInView = YES;
    BlackSixteen.numberOfTapsRequired = 1;
    ObjectFiveTwo.userInteractionEnabled = YES;
    [ObjectFiveTwo addGestureRecognizer:BlackSixteen];
    
    UITapGestureRecognizer *BlackSeventeen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackSeventeen.cancelsTouchesInView = YES;
    BlackSeventeen.numberOfTapsRequired = 1;
    ObjectSixTwo.userInteractionEnabled = YES;
    [ObjectSixTwo addGestureRecognizer:BlackSeventeen];
    
    UITapGestureRecognizer *BlackEighteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackEighteen.cancelsTouchesInView = YES;
    BlackEighteen.numberOfTapsRequired = 1;
    ObjectSevenTwo.userInteractionEnabled = YES;
    [ObjectSevenTwo addGestureRecognizer:BlackEighteen];
    
    UITapGestureRecognizer *BlackNineteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackNineteen.cancelsTouchesInView = YES;
    BlackNineteen.numberOfTapsRequired = 1;
    ObjectEightTwo.userInteractionEnabled = YES;
    [ObjectEightTwo addGestureRecognizer:BlackNineteen];
    
    UITapGestureRecognizer *BlackTwenty = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackTwenty.cancelsTouchesInView = YES;
    BlackTwenty.numberOfTapsRequired = 1;
    ObjectNineTwo.userInteractionEnabled = YES;
    [ObjectNineTwo addGestureRecognizer:BlackTwenty];
    
    UITapGestureRecognizer *BlackTwentyOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackTwentyOne.cancelsTouchesInView = YES;
    BlackTwentyOne.numberOfTapsRequired = 1;
    ObjectTenTwo.userInteractionEnabled = YES;
    [ObjectTenTwo addGestureRecognizer:BlackTwentyOne];
    
    UITapGestureRecognizer *BlackTwentyTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BlackTwo:)];
    BlackTwentyTwo.cancelsTouchesInView = YES;
    BlackTwentyTwo.numberOfTapsRequired = 1;
    ObjectElevenTwo.userInteractionEnabled = YES;
    [ObjectElevenTwo addGestureRecognizer:BlackTwentyTwo];
    
    if (TheBackGround == 1) {
        BackGround.image = [UIImage imageNamed:@"Forest-Snow.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Forest-Snow.png"];
    } else if (TheBackGround == 2) {
        BackGround.image = [UIImage imageNamed:@"Petal-Violet.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Petal-Violet.png"];
    } else if (TheBackGround == 3) {
        BackGround.image = [UIImage imageNamed:@"Petal-Orange.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Petal-Orange.png"];
    } else if (TheBackGround == 4) {
        BackGround.image = [UIImage imageNamed:@"Apple-Wallpaper.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Apple-Wallpaper.png"];
    } else if (TheBackGround == 5) {
        BackGround.image = [UIImage imageNamed:@"Petal-VP.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Petal-VP.png"];
    } else if (TheBackGround == 6) {
        BackGround.image = [UIImage imageNamed:@"Petal-White.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Forest-Snow.png"];
    } else if (TheBackGround == 7) {
        BackGround.image = [UIImage imageNamed:@"Night-Image.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Night-Image.png"];
    } else if (TheBackGround == 8) {
        BackGround.image = [UIImage imageNamed:@"Yosimite.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Yosimite.png"];
    } else if (TheBackGround == 9) {
        BackGround.image = [UIImage imageNamed:@"Petal-Purple.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Petal-Purple.png"];
    } else if (TheBackGround == 10) {
        BackGround.image = [UIImage imageNamed:@"Petel-Green.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Petel-Green.png"];
    } else if (TheBackGround == 11) {
        BackGround.image = [UIImage imageNamed:@"apple.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"apple.png"];
    } else if (TheBackGround == 12) {
        BackGround.image = [UIImage imageNamed:@"Blue-CreamBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Blue-CreamBG.png"];
    } else if (TheBackGround == 13) {
        BackGround.image = [UIImage imageNamed:@"Blue-Green-WhiteBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Blue-Green-WhiteBG.png"];
    } else if (TheBackGround == 14) {
        BackGround.image = [UIImage imageNamed:@"Blue-WhiteBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Blue-WhiteBG.png"];
    } else if (TheBackGround == 15) {
        BackGround.image = [UIImage imageNamed:@"ColdJaggyBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"ColdJaggyBG.png"];
    } else if (TheBackGround == 16) {
        BackGround.image = [UIImage imageNamed:@"DesetDarkBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"DesetDarkBG.png"];
    } else if (TheBackGround == 17) {
        BackGround.image = [UIImage imageNamed:@"GrassBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"GrassBG.png"];
    } else if (TheBackGround == 18) {
        BackGround.image = [UIImage imageNamed:@"Green-BlueBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Green-BlueBG.png"];
    } else if (TheBackGround == 19) {
        BackGround.image = [UIImage imageNamed:@"GreenBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"GreenBG.png"];
    } else if (TheBackGround == 20) {
        BackGround.image = [UIImage imageNamed:@"LakeForestBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"LakeForestBG.png"];
    } else if (TheBackGround == 21) {
        BackGround.image = [UIImage imageNamed:@"MultiWaveBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"MultiWaveBG.png"];
    } else if (TheBackGround == 22) {
        BackGround.image = [UIImage imageNamed:@"OrangeFlowers.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"OrangeFlowers.png"];
    } else if (TheBackGround == 23) {
        BackGround.image = [UIImage imageNamed:@"PartyBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"PartyBG.png"];
    } else if (TheBackGround == 24) {
        BackGround.image = [UIImage imageNamed:@"Purple-WhiteBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"Purple-WhiteBG.png"];
    } else if (TheBackGround == 25) {
        BackGround.image = [UIImage imageNamed:@"WarmJaggyBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"WarmJaggyBG.png"];
    } else if (TheBackGround == 26) {
        BackGround.image = [UIImage imageNamed:@"WaterFlowBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"WaterFlowBG.png"];
    } else if (TheBackGround == 27) {
        BackGround.image = [UIImage imageNamed:@"nightimage?.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"nightimage?.png"];
    } else if (TheBackGround == 28) {
        BackGround.image = [UIImage imageNamed:@"rainforest.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"rainforest.png"];
    } else if (TheBackGround == 29) {
        BackGround.image = [UIImage imageNamed:@"earth.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"earth.png"];
    } else if (TheBackGround == 30) {
        BackGround.image = [UIImage imageNamed:@"SunDown.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"SunDown.png"];
    } else if (TheBackGround == 31) {
        BackGround.image = [UIImage imageNamed:@"CoolBackGrond.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"CoolBackGrond.png"];
    } else if (TheBackGround == 32) {
        BackGround.image = [UIImage imageNamed:@"BigHomeScreen.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"BigHomeScreen.png"];
    } else if (TheBackGround == 33) {
        BackGround.image = [UIImage imageNamed:@"WaterPic.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"WaterPic.png"];
    } else if (TheBackGround == 34) {
        BackGround.image = [UIImage imageNamed:@"SplitBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"SplitBG.png"];
    } else if (TheBackGround == 35) {
        BackGround.image = [UIImage imageNamed:@"northenlights.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"northenlights.png"];
    } else if (TheBackGround == 36) {
        BackGround.image = [UIImage imageNamed:@"GoldSkyBG.png"];
        BackGroundTwo.image = [UIImage imageNamed:@"GoldSkyBG.png"];
    }
    
    if (TheButton == 1) {
        ObjectRedOne.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        ObjectRedOne.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        ObjectRedOne.image = [UIImage imageNamed:@"Pink.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        ObjectRedOne.image = [UIImage imageNamed:@"Green.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        ObjectRedOne.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        ObjectRedOne.image = [UIImage imageNamed:@"Brown.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        ObjectRedOne.image = [UIImage imageNamed:@"Purple.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        ObjectRedOne.image = [UIImage imageNamed:@"Blue.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        ObjectRedOne.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        ObjectRedOne.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        ObjectRedOne.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        ObjectRedOne.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        ObjectRedOne.image = [UIImage imageNamed:@"Lime.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        ObjectRedOne.image = [UIImage imageNamed:@"Violet.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        ObjectRedOne.image = [UIImage imageNamed:@"White.png"];
        ObjectRedTwo.image = [UIImage imageNamed:@"White.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
