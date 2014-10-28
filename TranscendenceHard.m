//
//  TranscendenceHard.m
//  Quicky Tap
//
//  Created by Michael Mooney on 18/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "TranscendenceHard.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"

double Time;
int Score, Placement;

@interface TranscendenceHard ()
{
    IBOutlet UIImageView *ObjectOne, *ObjectTwo, *ObjectThree, *ObjectFour, *ObjectFive, *ObjectSix, *ObjectSeven, *ObjectEight, *ObjectNine, *ObjectTen, *ObjectEleven, *ObjectTwelve, *ObjectThirteen, *ObjectFourteen, *ObjectFithteen, *ObjectSixteen, *ObjectSeventeen, *ObjectEighteen, *ObjectNineteen, *ObjectTwenty, *ObjectTwentyOne, *ObjectTwentyTwo, *ObjectTwentyThree, *ObjectTwentyFour, *ObjectTwentyFive, *ObjectTwentySix, *ObjectTwentySeven, *ObjectTwentyEight, *ObjectTwentyNine, *ObjectThirty, *ObjectThirtyOne, *ObjectThirtyTwo, *ObjectThirtyThree, *ObjectThirtyFour, *ObjectThirtyFive, *ObjectRed;
    
    IBOutlet UILabel *InGameScore, *InGameCounter;
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display, *BackGround;
    NSTimer *Timer;
}

@end

@implementation TranscendenceHard

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)Red:(UITapGestureRecognizer *)sender
{
    Score = Score + 1;
    
    [Timer invalidate];
    Timer = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
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
    
    if (Score >= 100) {
        [self EndGame];
    }
    
    [self Game];
}

-(void)Black:(UITapGestureRecognizer *)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    [self GameOver];
}

-(void)Game
{
    InGameScore.text = [NSString stringWithFormat:@"%i of 100", Score];
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
    Placement = arc4random_uniform(36);
    
    switch (Placement) {
        case 1:
            ObjectRed.center = CGPointMake(72, 279);
            ObjectOne.center = CGPointMake(197, 279);
            ObjectTwo.center = CGPointMake(322, 279);
            ObjectThree.center = CGPointMake(447, 279);
            ObjectFour.center = CGPointMake(572, 279);
            ObjectFive.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 2:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectRed.center = CGPointMake(197, 279);
            ObjectTwo.center = CGPointMake(322, 279);
            ObjectThree.center = CGPointMake(447, 279);
            ObjectFour.center = CGPointMake(572, 279);
            ObjectFive.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 3:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectRed.center = CGPointMake(322, 279);
            ObjectThree.center = CGPointMake(447, 279);
            ObjectFour.center = CGPointMake(572, 279);
            ObjectFive.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 4:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectRed.center = CGPointMake(447, 279);
            ObjectFour.center = CGPointMake(572, 279);
            ObjectFive.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 5:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectRed.center = CGPointMake(572, 279);
            ObjectFive.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 6:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectRed.center = CGPointMake(697, 279);
            
            ObjectSix.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 7:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectRed.center = CGPointMake(72, 413);
            ObjectSeven.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 8:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectRed.center = CGPointMake(197, 413);
            ObjectEight.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 9:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectRed.center = CGPointMake(322, 413);
            ObjectNine.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 10:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectRed.center = CGPointMake(447, 413);
            ObjectTen.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 11:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectRed.center = CGPointMake(572, 413);
            ObjectEleven.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 12:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectRed.center = CGPointMake(697, 413);
            
            ObjectTwelve.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 13:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectRed.center = CGPointMake(72, 547);
            ObjectThirteen.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 14:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectRed.center = CGPointMake(197, 547);
            ObjectFourteen.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 15:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectRed.center = CGPointMake(322, 547);
            ObjectFithteen.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 16:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectRed.center = CGPointMake(447, 547);
            ObjectSixteen.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 17:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectRed.center = CGPointMake(572, 547);
            ObjectSeventeen.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 18:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectRed.center = CGPointMake(697, 547);
            
            ObjectEighteen.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 19:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectRed.center = CGPointMake(72, 681);
            ObjectNineteen.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 20:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectRed.center = CGPointMake(197, 681);
            ObjectTwenty.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 21:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectRed.center = CGPointMake(322, 681);
            ObjectTwentyOne.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 22:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectRed.center = CGPointMake(447, 681);
            ObjectTwentyTwo.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 23:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectRed.center = CGPointMake(572, 681);
            ObjectTwentyThree.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 24:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectRed.center = CGPointMake(697, 681);
            
            ObjectTwentyFour.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 25:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectRed.center = CGPointMake(72, 815);
            ObjectTwentyFive.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 26:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectRed.center = CGPointMake(197, 815);
            ObjectTwentySix.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 27:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectRed.center = CGPointMake(322, 815);
            ObjectTwentySeven.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 28:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectRed.center = CGPointMake(447, 815);
            ObjectTwentyEight.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 29:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectRed.center = CGPointMake(572, 815);
            ObjectTwentyNine.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 30:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectRed.center = CGPointMake(697, 815);
            
            ObjectThirty.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 31:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectRed.center = CGPointMake(72, 949);
            ObjectThirtyOne.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 32:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectThirtyOne.center = CGPointMake(72, 949);
            ObjectRed.center = CGPointMake(197, 949);
            ObjectThirtyTwo.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 33:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectThirtyOne.center = CGPointMake(72, 949);
            ObjectThirtyTwo.center = CGPointMake(197, 949);
            ObjectRed.center = CGPointMake(322, 949);
            ObjectThirtyThree.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 34:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectThirtyOne.center = CGPointMake(72, 949);
            ObjectThirtyTwo.center = CGPointMake(197, 949);
            ObjectThirtyThree.center = CGPointMake(322, 949);
            ObjectRed.center = CGPointMake(447, 949);
            ObjectThirtyFour.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 35:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectThirtyOne.center = CGPointMake(72, 949);
            ObjectThirtyTwo.center = CGPointMake(197, 949);
            ObjectThirtyThree.center = CGPointMake(322, 949);
            ObjectThirtyFour.center = CGPointMake(447, 949);
            ObjectRed.center = CGPointMake(572, 949);
            ObjectThirtyFive.center = CGPointMake(697, 949);
            break;
        case 36:
            ObjectOne.center = CGPointMake(72, 279);
            ObjectTwo.center = CGPointMake(197, 279);
            ObjectThree.center = CGPointMake(322, 279);
            ObjectFour.center = CGPointMake(447, 279);
            ObjectFive.center = CGPointMake(572, 279);
            ObjectSix.center = CGPointMake(697, 279);
            
            ObjectSeven.center = CGPointMake(72, 413);
            ObjectEight.center = CGPointMake(197, 413);
            ObjectNine.center = CGPointMake(322, 413);
            ObjectTen.center = CGPointMake(447, 413);
            ObjectEleven.center = CGPointMake(572, 413);
            ObjectTwelve.center = CGPointMake(697, 413);
            
            ObjectThirteen.center = CGPointMake(72, 547);
            ObjectFourteen.center = CGPointMake(197, 547);
            ObjectFithteen.center = CGPointMake(322, 547);
            ObjectSixteen.center = CGPointMake(447, 547);
            ObjectSeventeen.center = CGPointMake(572, 547);
            ObjectEighteen.center = CGPointMake(697, 547);
            
            ObjectNineteen.center = CGPointMake(72, 681);
            ObjectTwenty.center = CGPointMake(197, 681);
            ObjectTwentyOne.center = CGPointMake(322, 681);
            ObjectTwentyTwo.center = CGPointMake(447, 681);
            ObjectTwentyThree.center = CGPointMake(572, 681);
            ObjectTwentyFour.center = CGPointMake(697, 681);
            
            ObjectTwentyFive.center = CGPointMake(72, 815);
            ObjectTwentySix.center = CGPointMake(197, 815);
            ObjectTwentySeven.center = CGPointMake(322, 815);
            ObjectTwentyEight.center = CGPointMake(447, 815);
            ObjectTwentyNine.center = CGPointMake(572, 815);
            ObjectThirty.center = CGPointMake(697, 815);
            
            ObjectThirtyOne.center = CGPointMake(72, 949);
            ObjectThirtyTwo.center = CGPointMake(197, 949);
            ObjectThirtyThree.center = CGPointMake(322, 949);
            ObjectThirtyFour.center = CGPointMake(447, 949);
            ObjectThirtyFive.center = CGPointMake(572, 949);
            ObjectRed.center = CGPointMake(697, 949);
            break;
        default:
            break;
    }
}

-(void)Counter
{
    Time = Time - 0.01;
    NSLog(@"%.2f", Time);
    InGameCounter.text = [NSString stringWithFormat:@"%.2f", Time];
    
    if (0 > Time) {
        [self GameOver];
    }
    
    if (Score >= 100) {
        [Timer invalidate];
        Timer = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
}

-(void)GameOver
{
    [self Fadein];
    [Timer invalidate];
    Timer = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    ObjectOne.hidden = YES;
    ObjectTwo.hidden = YES;
    ObjectThree.hidden = YES;
    ObjectFour.hidden = YES;
    ObjectFive.hidden = YES;
    ObjectSix.hidden = YES;
    ObjectSeven.hidden = YES;
    ObjectEight.hidden = YES;
    ObjectNine.hidden = YES;
    ObjectTen.hidden = YES;
    ObjectEleven.hidden = YES;
    ObjectTwelve.hidden = YES;
    ObjectThirteen.hidden = YES;
    ObjectFourteen.hidden = YES;
    ObjectFithteen.hidden = YES;
    ObjectSixteen.hidden = YES;
    ObjectSeventeen.hidden = YES;
    ObjectEighteen.hidden = YES;
    ObjectNineteen.hidden = YES;
    ObjectTwenty.hidden = YES;
    ObjectTwentyOne.hidden = YES;
    ObjectTwentyTwo.hidden = YES;
    ObjectTwentyThree.hidden = YES;
    ObjectTwentyFour.hidden = YES;
    ObjectTwentyFive.hidden = YES;
    ObjectTwentySix.hidden = YES;
    ObjectTwentySeven.hidden = YES;
    ObjectTwentyEight.hidden = YES;
    ObjectTwentyNine.hidden = YES;
    ObjectThirty.hidden = YES;
    ObjectThirtyOne.hidden = YES;
    ObjectThirtyTwo.hidden = YES;
    ObjectThirtyThree.hidden = YES;
    ObjectThirtyFour.hidden = YES;
    ObjectThirtyFive.hidden = YES;
    ObjectRed.hidden = YES;
    
    InGameScore.hidden = YES;
    InGameCounter.hidden = YES;
    
    Display.hidden = NO;
    Display.image = [UIImage imageNamed:@"Unlucky.png"];
    Home.hidden = NO;
    Replay.hidden = NO;
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

-(void)EndGame
{
    [self Fadein];
    [Timer invalidate];
    Timer = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    Display.image = [UIImage imageNamed:@"WellDone.png"];
    
    ObjectOne.hidden = YES;
    ObjectTwo.hidden = YES;
    ObjectThree.hidden = YES;
    ObjectFour.hidden = YES;
    ObjectFive.hidden = YES;
    ObjectSix.hidden = YES;
    ObjectSeven.hidden = YES;
    ObjectEight.hidden = YES;
    ObjectNine.hidden = YES;
    ObjectTen.hidden = YES;
    ObjectEleven.hidden = YES;
    ObjectTwelve.hidden = YES;
    ObjectThirteen.hidden = YES;
    ObjectFourteen.hidden = YES;
    ObjectFithteen.hidden = YES;
    ObjectSixteen.hidden = YES;
    ObjectSeventeen.hidden = YES;
    ObjectEighteen.hidden = YES;
    ObjectNineteen.hidden = YES;
    ObjectTwenty.hidden = YES;
    ObjectTwentyOne.hidden = YES;
    ObjectTwentyTwo.hidden = YES;
    ObjectTwentyThree.hidden = YES;
    ObjectTwentyFour.hidden = YES;
    ObjectTwentyFive.hidden = YES;
    ObjectTwentySix.hidden = YES;
    ObjectTwentySeven.hidden = YES;
    ObjectTwentyEight.hidden = YES;
    ObjectTwentyNine.hidden = YES;
    ObjectThirty.hidden = YES;
    ObjectThirtyOne.hidden = YES;
    ObjectThirtyTwo.hidden = YES;
    ObjectThirtyThree.hidden = YES;
    ObjectThirtyFour.hidden = YES;
    ObjectThirtyFive.hidden = YES;
    ObjectRed.hidden = YES;
    
    InGameScore.hidden = YES;
    InGameCounter.hidden = YES;
    
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    
}

- (void)viewDidLoad {
    
    Time = 40;
    Score = 0;
    
    InGameScore.text = [NSString stringWithFormat:@"%i of 100", Score];
    InGameCounter.text = [NSString stringWithFormat:@"%.2f", Time];
    
    Display.hidden = YES;
    Home.hidden = YES;
    Replay.hidden = YES;
    
    UITapGestureRecognizer *One = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    One.cancelsTouchesInView = YES;
    One.numberOfTapsRequired = 1;
    ObjectOne.userInteractionEnabled = YES;
    [ObjectOne addGestureRecognizer:One];
    
    UITapGestureRecognizer *Two = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Two.cancelsTouchesInView = YES;
    Two.numberOfTapsRequired = 1;
    ObjectTwo.userInteractionEnabled = YES;
    [ObjectTwo addGestureRecognizer:Two];
    
    UITapGestureRecognizer *Three = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Three.cancelsTouchesInView = YES;
    Three.numberOfTapsRequired = 1;
    ObjectThree.userInteractionEnabled = YES;
    [ObjectThree addGestureRecognizer:Three];
    
    UITapGestureRecognizer *Four = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Four.cancelsTouchesInView = YES;
    Four.numberOfTapsRequired = 1;
    ObjectFour.userInteractionEnabled = YES;
    [ObjectFour addGestureRecognizer:Four];
    
    UITapGestureRecognizer *Five = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Five.cancelsTouchesInView = YES;
    Five.numberOfTapsRequired = 1;
    ObjectFive.userInteractionEnabled = YES;
    [ObjectFive addGestureRecognizer:Five];
    
    UITapGestureRecognizer *Six = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Six.cancelsTouchesInView = YES;
    Six.numberOfTapsRequired = 1;
    ObjectSix.userInteractionEnabled = YES;
    [ObjectSix addGestureRecognizer:Six];
    
    UITapGestureRecognizer *Seven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Seven.cancelsTouchesInView = YES;
    Seven.numberOfTapsRequired = 1;
    ObjectSeven.userInteractionEnabled = YES;
    [ObjectSeven addGestureRecognizer:Seven];
    
    UITapGestureRecognizer *Eight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Eight.cancelsTouchesInView = YES;
    Eight.numberOfTapsRequired = 1;
    ObjectEight.userInteractionEnabled = YES;
    [ObjectEight addGestureRecognizer:Eight];
    
    UITapGestureRecognizer *Nine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Nine.cancelsTouchesInView = YES;
    Nine.numberOfTapsRequired = 1;
    ObjectNine.userInteractionEnabled = YES;
    [ObjectNine addGestureRecognizer:Nine];
    
    UITapGestureRecognizer *Ten = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Ten.cancelsTouchesInView = YES;
    Ten.numberOfTapsRequired = 1;
    ObjectTen.userInteractionEnabled = YES;
    [ObjectTen addGestureRecognizer:Ten];
    
    UITapGestureRecognizer *Eleven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Eleven.cancelsTouchesInView = YES;
    Eleven.numberOfTapsRequired = 1;
    ObjectEleven.userInteractionEnabled = YES;
    [ObjectEleven addGestureRecognizer:Eleven];
    
    UITapGestureRecognizer *Twelve = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Twelve.cancelsTouchesInView = YES;
    Twelve.numberOfTapsRequired = 1;
    ObjectTwelve.userInteractionEnabled = YES;
    [ObjectTwelve addGestureRecognizer:Twelve];
    
    UITapGestureRecognizer *Thirteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Thirteen.cancelsTouchesInView = YES;
    Thirteen.numberOfTapsRequired = 1;
    ObjectThirteen.userInteractionEnabled = YES;
    [ObjectThirteen addGestureRecognizer:Thirteen];
    
    UITapGestureRecognizer *Fourteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Fourteen.cancelsTouchesInView = YES;
    Fourteen.numberOfTapsRequired = 1;
    ObjectFourteen.userInteractionEnabled = YES;
    [ObjectFourteen addGestureRecognizer:Fourteen];
    
    UITapGestureRecognizer *Fithteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Fithteen.cancelsTouchesInView = YES;
    Fithteen.numberOfTapsRequired = 1;
    ObjectFithteen.userInteractionEnabled = YES;
    [ObjectFithteen addGestureRecognizer:Fithteen];
    
    UITapGestureRecognizer *Sixteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Sixteen.cancelsTouchesInView = YES;
    Sixteen.numberOfTapsRequired = 1;
    ObjectSixteen.userInteractionEnabled = YES;
    [ObjectSixteen addGestureRecognizer:Sixteen];
    
    UITapGestureRecognizer *Seventeen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Seventeen.cancelsTouchesInView = YES;
    Seventeen.numberOfTapsRequired = 1;
    ObjectSeventeen.userInteractionEnabled = YES;
    [ObjectSeventeen addGestureRecognizer:Seventeen];
    
    UITapGestureRecognizer *Eighteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Eighteen.cancelsTouchesInView = YES;
    Eighteen.numberOfTapsRequired = 1;
    ObjectEighteen.userInteractionEnabled = YES;
    [ObjectEighteen addGestureRecognizer:Eighteen];
    
    UITapGestureRecognizer *Nineteem = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Nineteem.cancelsTouchesInView = YES;
    Nineteem.numberOfTapsRequired = 1;
    ObjectNineteen.userInteractionEnabled = YES;
    [ObjectNineteen addGestureRecognizer:Nineteem];
    
    UITapGestureRecognizer *Twenty = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Twenty.cancelsTouchesInView = YES;
    Twenty.numberOfTapsRequired = 1;
    ObjectTwenty.userInteractionEnabled = YES;
    [ObjectTwenty addGestureRecognizer:Twenty];
    
    UITapGestureRecognizer *TwentyOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyOne.cancelsTouchesInView = YES;
    TwentyOne.numberOfTapsRequired = 1;
    ObjectTwentyOne.userInteractionEnabled = YES;
    [ObjectTwentyOne addGestureRecognizer:TwentyOne];
    
    UITapGestureRecognizer *TwentyTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyTwo.cancelsTouchesInView = YES;
    TwentyTwo.numberOfTapsRequired = 1;
    ObjectTwentyTwo.userInteractionEnabled = YES;
    [ObjectTwentyTwo addGestureRecognizer:TwentyTwo];
    
    UITapGestureRecognizer *TwentyThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyThree.cancelsTouchesInView = YES;
    TwentyThree.numberOfTapsRequired = 1;
    ObjectTwentyThree.userInteractionEnabled = YES;
    [ObjectTwentyThree addGestureRecognizer:TwentyThree];
    
    UITapGestureRecognizer *TwentyFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyFour.cancelsTouchesInView = YES;
    TwentyFour.numberOfTapsRequired = 1;
    ObjectTwentyFour.userInteractionEnabled = YES;
    [ObjectTwentyFour addGestureRecognizer:TwentyFour];
    
    UITapGestureRecognizer *TwentyFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyFive.cancelsTouchesInView = YES;
    TwentyFive.numberOfTapsRequired = 1;
    ObjectTwentyFive.userInteractionEnabled = YES;
    [ObjectTwentyFive addGestureRecognizer:TwentyFive];
    
    UITapGestureRecognizer *TwentySix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentySix.cancelsTouchesInView = YES;
    TwentySix.numberOfTapsRequired = 1;
    ObjectTwentySix.userInteractionEnabled = YES;
    [ObjectTwentySix addGestureRecognizer:TwentySix];
    
    UITapGestureRecognizer *TwentySeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentySeven.cancelsTouchesInView = YES;
    TwentySeven.numberOfTapsRequired = 1;
    ObjectTwentySeven.userInteractionEnabled = YES;
    [ObjectTwentySeven addGestureRecognizer:TwentySeven];
    
    UITapGestureRecognizer *TwentyEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyEight.cancelsTouchesInView = YES;
    TwentyEight.numberOfTapsRequired = 1;
    ObjectTwentyEight.userInteractionEnabled = YES;
    [ObjectTwentyEight addGestureRecognizer:TwentyEight];
    
    UITapGestureRecognizer *TwentyNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    TwentyNine.cancelsTouchesInView = YES;
    TwentyNine.numberOfTapsRequired = 1;
    ObjectTwentyNine.userInteractionEnabled = YES;
    [ObjectTwentyNine addGestureRecognizer:TwentyNine];
    
    UITapGestureRecognizer *Thirty = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    Thirty.cancelsTouchesInView = YES;
    Thirty.numberOfTapsRequired = 1;
    ObjectThirty.userInteractionEnabled = YES;
    [ObjectThirty addGestureRecognizer:Thirty];
    
    UITapGestureRecognizer *ThirtyOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    ThirtyOne.cancelsTouchesInView = YES;
    ThirtyOne.numberOfTapsRequired = 1;
    ObjectThirtyOne.userInteractionEnabled = YES;
    [ObjectThirtyOne addGestureRecognizer:ThirtyOne];
    
    UITapGestureRecognizer *ThirtyTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    ThirtyTwo.cancelsTouchesInView = YES;
    ThirtyTwo.numberOfTapsRequired = 1;
    ObjectThirtyTwo.userInteractionEnabled = YES;
    [ObjectThirtyTwo addGestureRecognizer:ThirtyTwo];
    
    UITapGestureRecognizer *ThirtyThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    ThirtyThree.cancelsTouchesInView = YES;
    ThirtyThree.numberOfTapsRequired = 1;
    ObjectThirtyThree.userInteractionEnabled = YES;
    [ObjectThirtyThree addGestureRecognizer:ThirtyThree];
    
    UITapGestureRecognizer *ThirtyFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    ThirtyFour.cancelsTouchesInView = YES;
    ThirtyFour.numberOfTapsRequired = 1;
    ObjectThirtyFour.userInteractionEnabled = YES;
    [ObjectThirtyFour addGestureRecognizer:ThirtyFour];
    
    UITapGestureRecognizer *ThirtyFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    ThirtyFive.cancelsTouchesInView = YES;
    ThirtyFive.numberOfTapsRequired = 1;
    ObjectThirtyFive.userInteractionEnabled = YES;
    [ObjectThirtyFive addGestureRecognizer:ThirtyFive];
    
    UITapGestureRecognizer *Red = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red:)];
    Red.cancelsTouchesInView = YES;
    Red.numberOfTapsRequired = 1;
    ObjectRed.userInteractionEnabled = YES;
    [ObjectRed addGestureRecognizer:Red];
    
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
        ObjectRed.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        ObjectRed.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        ObjectRed.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        ObjectRed.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        ObjectRed.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        ObjectRed.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        ObjectRed.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        ObjectRed.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        ObjectRed.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        ObjectRed.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        ObjectRed.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        ObjectRed.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        ObjectRed.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        ObjectRed.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        ObjectRed.image = [UIImage imageNamed:@"White.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
