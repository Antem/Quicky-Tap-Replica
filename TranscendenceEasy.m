//
//  TranscendenceEasy.m
//  Quicky Tap
//
//  Created by Michael Mooney on 18/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "TranscendenceEasy.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"

double Time;
int Score, Placement;

@interface TranscendenceEasy ()
{
    IBOutlet UIImageView *ObjectOne, *ObjectTwo, *ObjectThree, *ObjectFour, *ObjectFive, *ObjectSix, *ObjectSeven, *ObjectEight, *ObjectNine, *ObjectTen, *ObjectEleven, *ObjectTwelve, *ObjectThirteen, *ObjectFourteen, *ObjectFithteen, *ObjectRed;
    
    IBOutlet UILabel *InGameScore, *InGameCounter;
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display;
    IBOutlet UIImageView *BackGround;
    NSTimer *Timer;
}

@end

@implementation TranscendenceEasy

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
    
    if (Score >= 35) {
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
    InGameScore.text = [NSString stringWithFormat:@"%i of 35", Score];
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
    Placement = arc4random_uniform(16);
    
    switch (Placement) {
        case 1:
            ObjectRed.center = CGPointMake(79, 269);
            ObjectOne.center = CGPointMake(289, 269);
            ObjectTwo.center = CGPointMake(499, 269);
            ObjectThree.center = CGPointMake(689, 269);
            
            ObjectFour.center = CGPointMake(79, 492);
            ObjectFive.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 2:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectRed.center = CGPointMake(289, 269);
            ObjectTwo.center = CGPointMake(499, 269);
            ObjectThree.center = CGPointMake(689, 269);
            
            ObjectFour.center = CGPointMake(79, 492);
            ObjectFive.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);

            break;
        case 3:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectRed.center = CGPointMake(499, 269);
            ObjectThree.center = CGPointMake(689, 269);
            
            ObjectFour.center = CGPointMake(79, 492);
            ObjectFive.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 4:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectRed.center = CGPointMake(689, 269);
            
            ObjectFour.center = CGPointMake(79, 492);
            ObjectFive.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 5:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectRed.center = CGPointMake(79, 492);
            ObjectFive.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 6:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectRed.center = CGPointMake(289, 492);
            ObjectSix.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 7:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectRed.center = CGPointMake(499, 492);
            ObjectSeven.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 8:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectRed.center = CGPointMake(689, 492);
            
            ObjectEight.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 9:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectRed.center = CGPointMake(79, 715);
            ObjectNine.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 10:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectRed.center = CGPointMake(289, 715);
            ObjectTen.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 11:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectRed.center = CGPointMake(499, 715);
            ObjectEleven.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 12:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectEleven.center = CGPointMake(499, 715);
            ObjectRed.center = CGPointMake(689, 715);
            
            ObjectTwelve.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 13:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectEleven.center = CGPointMake(499, 715);
            ObjectTwelve.center = CGPointMake(689, 715);
            
            ObjectRed.center = CGPointMake(79, 939);
            ObjectThirteen.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 14:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectEleven.center = CGPointMake(499, 715);
            ObjectTwelve.center = CGPointMake(689, 715);
            
            ObjectThirteen.center = CGPointMake(79, 939);
            ObjectRed.center = CGPointMake(289, 939);
            ObjectFourteen.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 15:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectEleven.center = CGPointMake(499, 715);
            ObjectTwelve.center = CGPointMake(689, 715);
            
            ObjectThirteen.center = CGPointMake(79, 939);
            ObjectFourteen.center = CGPointMake(289, 939);
            ObjectRed.center = CGPointMake(499, 939);
            ObjectFithteen.center = CGPointMake(689, 939);
            break;
        case 16:
            ObjectOne.center = CGPointMake(79, 269);
            ObjectTwo.center = CGPointMake(289, 269);
            ObjectThree.center = CGPointMake(499, 269);
            ObjectFour.center = CGPointMake(689, 269);
            
            ObjectFive.center = CGPointMake(79, 492);
            ObjectSix.center = CGPointMake(289, 492);
            ObjectSeven.center = CGPointMake(499, 492);
            ObjectEight.center = CGPointMake(689, 492);
            
            ObjectNine.center = CGPointMake(79, 715);
            ObjectTen.center = CGPointMake(289, 715);
            ObjectEleven.center = CGPointMake(499, 715);
            ObjectTwelve.center = CGPointMake(689, 715);
            
            ObjectThirteen.center = CGPointMake(79, 939);
            ObjectFourteen.center = CGPointMake(289, 939);
            ObjectFithteen.center = CGPointMake(499, 939);
            ObjectRed.center = CGPointMake(689, 939);
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
    
    if (Score >= 35) {
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
    ObjectRed.hidden = YES;
    
    InGameScore.hidden = YES;
    InGameCounter.hidden = YES;
    
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    
}

- (void)viewDidLoad {
    
    Time = 15;
    Score = 0;
    
    InGameScore.text = [NSString stringWithFormat:@"%i of 35", Score];
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

-(void)Area
{
    int One, Two, Three, Four, Five;
    
    One = ObjectOne.center.x;
    Two = ObjectTwo.center.x;
    Three = ObjectThree.center.x;
    Four = ObjectFour.center.x;

    Five = ObjectOne.center.y;
    
    int Six, Seven, Eight;
    
    Six = ObjectFive.center.y;
    Seven = ObjectNine.center.y;
    Eight = ObjectThirteen.center.y;
    
    NSLog(@"x: %i, %i, %i, %i", One, Two, Three, Four);
    NSLog(@"Y: %i, %i, %i, %i", Five, Six, Seven, Eight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
