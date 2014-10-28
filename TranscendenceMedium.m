//
//  TranscendenceMedium.m
//  Quicky Tap
//
//  Created by Michael Mooney on 18/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "TranscendenceMedium.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"

double Time;
int Score, Placement;

@interface TranscendenceMedium ()
{
    IBOutlet UIImageView *ObjectOne, *ObjectTwo, *ObjectThree, *ObjectFour, *ObjectFive, *ObjectSix, *ObjectSeven, *ObjectEight, *ObjectNine, *ObjectTen, *ObjectEleven, *ObjectTwelve, *ObjectThirteen, *ObjectFourteen, *ObjectFithteen, *ObjectSixteen, *ObjectSeventeen, *ObjectEighteen, *ObjectNineteen, *ObjectTwenty, *ObjectTwentyOne, *ObjectTwentyTwo, *ObjectTwentyThree, *ObjectTwentyFour, *ObjectRed;
    
    IBOutlet UILabel *InGameScore, *InGameCounter;
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display, *BackGround;
    NSTimer *Timer;
}

@end

@implementation TranscendenceMedium

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
    
    if (Score >= 65) {
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
    InGameScore.text = [NSString stringWithFormat:@"%i of 65", Score];
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
    Placement = arc4random_uniform(25);

    switch (Placement) {
        case 1:
            ObjectRed.center = CGPointMake(76, 275);
            ObjectOne.center = CGPointMake(230, 275);
            ObjectTwo.center = CGPointMake(384, 275);
            ObjectThree.center = CGPointMake(538, 275);
            ObjectFour.center = CGPointMake(692, 275);
            
            ObjectFive.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 2:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectRed.center = CGPointMake(230, 275);
            ObjectTwo.center = CGPointMake(384, 275);
            ObjectThree.center = CGPointMake(538, 275);
            ObjectFour.center = CGPointMake(692, 275);
            
            ObjectFive.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 3:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectRed.center = CGPointMake(384, 275);
            ObjectThree.center = CGPointMake(538, 275);
            ObjectFour.center = CGPointMake(692, 275);
            
            ObjectFive.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 4:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectRed.center = CGPointMake(538, 275);
            ObjectFour.center = CGPointMake(692, 275);
            
            ObjectFive.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 5:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectRed.center = CGPointMake(692, 275);
            
            ObjectFive.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 6:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectRed.center = CGPointMake(76, 440);
            ObjectSix.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 7:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectRed.center = CGPointMake(230, 440);
            ObjectSeven.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 8:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectRed.center = CGPointMake(384, 440);
            ObjectEight.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 9:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectRed.center = CGPointMake(538, 440);
            ObjectNine.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 10:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectRed.center = CGPointMake(692, 440);
            
            ObjectTen.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 11:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectRed.center = CGPointMake(76, 605);
            ObjectEleven.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 12:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectRed.center = CGPointMake(230, 605);
            ObjectTwelve.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 13:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectRed.center = CGPointMake(384, 605);
            ObjectThirteen.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 14:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectRed.center = CGPointMake(538, 605);
            ObjectFourteen.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 15:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectRed.center = CGPointMake(692, 605);
            
            ObjectFithteen.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 16:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectRed.center = CGPointMake(76, 770);
            ObjectSixteen.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 17:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectRed.center = CGPointMake(230, 770);
            ObjectSeventeen.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 18:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectRed.center = CGPointMake(384, 770);
            ObjectEighteen.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 19:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectRed.center = CGPointMake(538, 770);
            ObjectNineteen.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 20:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectRed.center = CGPointMake(692, 770);
            
            ObjectTwenty.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 21:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectTwenty.center = CGPointMake(692, 770);
            
            ObjectRed.center = CGPointMake(76, 935);
            ObjectTwentyOne.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 22:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectTwenty.center = CGPointMake(692, 770);
            
            ObjectTwentyOne.center = CGPointMake(76, 935);
            ObjectRed.center = CGPointMake(230, 935);
            ObjectTwentyTwo.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 23:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectTwenty.center = CGPointMake(692, 770);
            
            ObjectTwentyOne.center = CGPointMake(76, 935);
            ObjectTwentyTwo.center = CGPointMake(230, 935);
            ObjectRed.center = CGPointMake(384, 935);
            ObjectTwentyThree.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 24:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectTwenty.center = CGPointMake(692, 770);
            
            ObjectTwentyOne.center = CGPointMake(76, 935);
            ObjectTwentyTwo.center = CGPointMake(230, 935);
            ObjectTwentyThree.center = CGPointMake(384, 935);
            ObjectRed.center = CGPointMake(538, 935);
            ObjectTwentyFour.center = CGPointMake(692, 935);
            break;
        case 25:
            ObjectOne.center = CGPointMake(76, 275);
            ObjectTwo.center = CGPointMake(230, 275);
            ObjectThree.center = CGPointMake(384, 275);
            ObjectFour.center = CGPointMake(538, 275);
            ObjectFive.center = CGPointMake(692, 275);
            
            ObjectSix.center = CGPointMake(76, 440);
            ObjectSeven.center = CGPointMake(230, 440);
            ObjectEight.center = CGPointMake(384, 440);
            ObjectNine.center = CGPointMake(538, 440);
            ObjectTen.center = CGPointMake(692, 440);
            
            ObjectEleven.center = CGPointMake(76, 605);
            ObjectTwelve.center = CGPointMake(230, 605);
            ObjectThirteen.center = CGPointMake(384, 605);
            ObjectFourteen.center = CGPointMake(538, 605);
            ObjectFithteen.center = CGPointMake(692, 605);
            
            ObjectSixteen.center = CGPointMake(76, 770);
            ObjectSeventeen.center = CGPointMake(230, 770);
            ObjectEighteen.center = CGPointMake(384, 770);
            ObjectNineteen.center = CGPointMake(538, 770);
            ObjectTwenty.center = CGPointMake(692, 770);
            
            ObjectTwentyOne.center = CGPointMake(76, 935);
            ObjectTwentyTwo.center = CGPointMake(230, 935);
            ObjectTwentyThree.center = CGPointMake(384, 935);
            ObjectTwentyFour.center = CGPointMake(538, 935);
            ObjectRed.center = CGPointMake(692, 935);
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
    
    if (Score >= 65) {
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
    ObjectRed.hidden = YES;
    
    InGameScore.hidden = YES;
    InGameCounter.hidden = YES;
    
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    
}

- (void)viewDidLoad {
    
    Time = 27;
    Score = 0;
    
    InGameScore.text = [NSString stringWithFormat:@"%i of 65", Score];
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
    [self Area];
}

-(void)Area
{
    int One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten;
    
    One = ObjectOne.center.x;
    Two = ObjectTwo.center.x;
    Three = ObjectThree.center.x;
    Four = ObjectFour.center.x;
    Five = ObjectFive.center.x;
    
    Six = ObjectFive.center.y;
    Seven = ObjectTen.center.y;
    Eight = ObjectFithteen.center.y;
    Nine = ObjectTwenty.center.y;
    Ten = ObjectRed.center.y;
    
    NSLog(@"X: %i, %i, %i, %i, %i", One, Two, Three, Four, Five);
    NSLog(@"Y: %i, %i, %i, %i, %i", Six, Seven, Eight, Nine, Ten);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
