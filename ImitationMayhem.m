//
//  ImitationMayhem.m
//  Quicky Tap
//
//  Created by Michael Mooney on 13/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "ImitationMayhem.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>


int Tapper;
double CounterNumber, HighScoreNumber;

@interface ImitationMayhem ()
{
    IBOutlet UIImageView *ObjectOne, *ObjectTwo, *ObjectThree;
    IBOutlet UIImageView *ObjectFour, *ObjectFive, *ObjectSix;
    IBOutlet UIImageView *ObjectSeven, *ObjectEight, *ObjectNine;
    IBOutlet UIImageView *ObjectTen, *ObjectEleven, *ObjectTwelve;
    IBOutlet UIImageView *ObjectThirteen, *ObjectFourteen, *ObjectFithteen;
    
    IBOutlet UIImageView *OtherOne, *OtherTwo, *OtherThree;
    IBOutlet UIImageView *OtherFour, *OtherFive, *OtherSix;
    IBOutlet UIImageView *OtherSeven, *OtherEight, *OtherNine;
    IBOutlet UIImageView *OtherTen, *OtherEleven, *OtherTwelve;
    IBOutlet UIImageView *OtherThirteen, *OtherFourteen, *OtherFithteen;
    
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display, *BackGround;
    IBOutlet UILabel *HighScore, *LastScore, *InGameScore;
    
    NSTimer *Counter;
}

@end

@implementation ImitationMayhem

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)One:(UITapGestureRecognizer *)sender
{
    ObjectOne.hidden = YES;
    OtherOne.hidden = NO;

    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Two:(UITapGestureRecognizer *)sender
{
    ObjectTwo.hidden = YES;
    OtherTwo.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Three:(UITapGestureRecognizer *)sender
{
    ObjectThree.hidden = YES;
    OtherThree.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Four:(UITapGestureRecognizer *)sender
{
    ObjectFour.hidden = YES;
    OtherFour.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Five:(UITapGestureRecognizer *)sender
{
    ObjectFive.hidden = YES;
    OtherFive.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Six:(UITapGestureRecognizer *)sender
{
    ObjectSix.hidden = YES;
    OtherSix.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Seven:(UITapGestureRecognizer *)sender
{
    ObjectSeven.hidden = YES;
    OtherSeven.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Eight:(UITapGestureRecognizer *)sender
{
    ObjectEight.hidden = YES;
    OtherEight.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Nine:(UITapGestureRecognizer *)sender
{
    ObjectNine.hidden = YES;
    OtherNine.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Ten:(UITapGestureRecognizer *)sender
{
    ObjectTen.hidden = YES;
    OtherTen.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Eleven:(UITapGestureRecognizer *)sender
{
    ObjectEleven.hidden = YES;
    OtherEleven.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Twelve:(UITapGestureRecognizer *)sender
{
    ObjectTwelve.hidden = YES;
    OtherTwelve.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Thirteen:(UITapGestureRecognizer *)sender
{
    ObjectThirteen.hidden = YES;
    OtherThirteen.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Fourteen:(UITapGestureRecognizer *)sender
{
    ObjectFourteen.hidden = YES;
    OtherFourteen.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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

-(void)Fithteen:(UITapGestureRecognizer *)sender
{
    ObjectFithteen.hidden = YES;
    OtherFithteen.hidden = NO;
    
    Tapper = Tapper + 1;
    if (Tapper >= 15) {
        [self EndGame];
    }
    
    [Counter invalidate];
    Counter = nil;
    
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
    Counter = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Score) userInfo:nil repeats:YES];
}

-(void)Score
{
    CounterNumber = CounterNumber + 0.01;
    NSLog(@"Score: %.2f", CounterNumber);
    InGameScore.text = [NSString stringWithFormat:@"%.2f", CounterNumber];
    if (Tapper >= 15) {
        [Counter invalidate];
        Counter = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
}

-(void)GameOver
{
    [self Fadein];
    
    [Counter invalidate];
    self->Counter = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    OtherOne.hidden = YES;
    OtherTwo.hidden = YES;
    OtherThree.hidden = YES;
    OtherFour.hidden = YES;
    OtherFive.hidden = YES;
    OtherSix.hidden = YES;
    OtherSeven.hidden = YES;
    OtherEight.hidden = YES;
    OtherNine.hidden = YES;
    OtherTen.hidden = YES;
    OtherEleven.hidden = YES;
    OtherTwelve.hidden = YES;
    OtherThirteen.hidden = YES;
    OtherFourteen.hidden = YES;
    OtherFithteen.hidden = YES;
    
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
    
    Home.hidden = NO;
    Replay.hidden = NO;
    
    Display.image = [UIImage imageNamed:@"TheGameOverScreen.png"];
    Display.hidden = NO;
    HighScore.hidden = NO;
    HighScore.text = [NSString stringWithFormat:@"%.2f", HighScoreNumber];
    InGameScore.hidden = YES;
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
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Imitation_Mayhem_Leaderboard"];
    int64_t GameCenterScoreTwentyThree = (int64_t) (HighScoreNumber * 100.00f);
    score.value = GameCenterScoreTwentyThree;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)EndGame
{
    [self Fadein];
    
    [Counter invalidate];
    self->Counter = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    OtherOne.hidden = YES;
    OtherTwo.hidden = YES;
    OtherThree.hidden = YES;
    OtherFour.hidden = YES;
    OtherFive.hidden = YES;
    OtherSix.hidden = YES;
    OtherSeven.hidden = YES;
    OtherEight.hidden = YES;
    OtherNine.hidden = YES;
    OtherTen.hidden = YES;
    OtherEleven.hidden = YES;
    OtherTwelve.hidden = YES;
    OtherThirteen.hidden = YES;
    OtherFourteen.hidden = YES;
    OtherFithteen.hidden = YES;
    
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
    
    Display.image = [UIImage imageNamed:@"TheNewDisplay.png"];
    
    InGameScore.hidden = YES;
    Display.hidden = NO;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    
    if (HighScoreNumber > CounterNumber) {
        HighScoreNumber = CounterNumber;
        [[NSUserDefaults standardUserDefaults] setDouble:HighScoreNumber forKey:@"ImitationMayhemScoreSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%.2f", CounterNumber];
    HighScore.text = [NSString stringWithFormat:@"%.2f", HighScoreNumber];
}

- (void)viewDidLoad {
    
    Home.hidden = YES;
    Replay.hidden = YES;
    Display.hidden = YES;
    HighScore.hidden = YES;
    LastScore.hidden = YES;
    
    OtherOne.hidden = YES;
    OtherTwo.hidden = YES;
    OtherThree.hidden = YES;
    OtherFour.hidden = YES;
    OtherFive.hidden = YES;
    OtherSix.hidden = YES;
    OtherSeven.hidden = YES;
    OtherEight.hidden = YES;
    OtherNine.hidden = YES;
    OtherTen.hidden = YES;
    OtherEleven.hidden = YES;
    OtherTwelve.hidden = YES;
    OtherThirteen.hidden = YES;
    OtherFourteen.hidden = YES;
    OtherFithteen.hidden = YES;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] doubleForKey:@"ImitationMayhemScoreSaved"];
    
    if (HighScoreNumber == 0) {
        NSString *Zen = @"You have to tap all the buttons twice. when you tap them twice they go black. So don't tap them three tinmes or the game will be over!";
        UIAlertView *ZnAlert = [[UIAlertView alloc] initWithTitle:@"Imitation Mayhem Help" message:Zen delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [ZnAlert show];
    }
    
    Tapper = 0;
    CounterNumber = 0;
    
    InGameScore.text = [NSString stringWithFormat:@"%.2f", CounterNumber];
    
    UITapGestureRecognizer *RedOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(One:)];
    RedOne.cancelsTouchesInView = YES;
    RedOne.numberOfTapsRequired = 2;
    ObjectOne.userInteractionEnabled = YES;
    [ObjectOne addGestureRecognizer:RedOne];
    
    UITapGestureRecognizer *BlackOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackOne.cancelsTouchesInView = YES;
    BlackOne.numberOfTapsRequired = 1;
    OtherOne.userInteractionEnabled = YES;
    [OtherOne addGestureRecognizer:BlackOne];
    
    //\\
    
    UITapGestureRecognizer *RedTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Two:)];
    RedTwo.cancelsTouchesInView = YES;
    RedTwo.numberOfTapsRequired = 2;
    ObjectTwo.userInteractionEnabled = YES;
    [ObjectTwo addGestureRecognizer:RedTwo];
    
    UITapGestureRecognizer *BlackTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackTwo.cancelsTouchesInView = YES;
    BlackTwo.numberOfTapsRequired = 1;
    OtherTwo.userInteractionEnabled = YES;
    [OtherTwo addGestureRecognizer:BlackTwo];
    
    //\\
    
    UITapGestureRecognizer *RedThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Three:)];
    RedThree.cancelsTouchesInView = YES;
    RedThree.numberOfTapsRequired = 2;
    ObjectThree.userInteractionEnabled = YES;
    [ObjectThree addGestureRecognizer:RedThree];
    
    UITapGestureRecognizer *BlackThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackThree.cancelsTouchesInView = YES;
    BlackThree.numberOfTapsRequired = 1;
    OtherThree.userInteractionEnabled = YES;
    [OtherThree addGestureRecognizer:BlackThree];
    
    //\\
    
    UITapGestureRecognizer *RedFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Four:)];
    RedFour.cancelsTouchesInView = YES;
    RedFour.numberOfTapsRequired = 2;
    ObjectFour.userInteractionEnabled = YES;
    [ObjectFour addGestureRecognizer:RedFour];
    
    UITapGestureRecognizer *BlackFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFour.cancelsTouchesInView = YES;
    BlackFour.numberOfTapsRequired = 1;
    OtherFour.userInteractionEnabled = YES;
    [OtherFour addGestureRecognizer:BlackFour];
    
    //\\
    
    UITapGestureRecognizer *RedFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Five:)];
    RedFive.cancelsTouchesInView = YES;
    RedFive.numberOfTapsRequired = 2;
    ObjectFive.userInteractionEnabled = YES;
    [ObjectFive addGestureRecognizer:RedFive];
    
    UITapGestureRecognizer *BlackFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFive.cancelsTouchesInView = YES;
    BlackFive.numberOfTapsRequired = 1;
    OtherFive.userInteractionEnabled = YES;
    [OtherFive addGestureRecognizer:BlackFive];
    
    //\\
    
    UITapGestureRecognizer *RedSix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Six:)];
    RedSix.cancelsTouchesInView = YES;
    RedSix.numberOfTapsRequired = 2;
    ObjectSix.userInteractionEnabled = YES;
    [ObjectSix addGestureRecognizer:RedSix];
    
    UITapGestureRecognizer *BlackSix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSix.cancelsTouchesInView = YES;
    BlackSix.numberOfTapsRequired = 1;
    OtherSix.userInteractionEnabled = YES;
    [OtherSix addGestureRecognizer:BlackSix];
    
    //\\
    
    UITapGestureRecognizer *RedSeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Seven:)];
    RedSeven.cancelsTouchesInView = YES;
    RedSeven.numberOfTapsRequired = 2;
    ObjectSeven.userInteractionEnabled = YES;
    [ObjectSeven addGestureRecognizer:RedSeven];
    
    UITapGestureRecognizer *BlackSeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackSeven.cancelsTouchesInView = YES;
    BlackSeven.numberOfTapsRequired = 1;
    OtherSeven.userInteractionEnabled = YES;
    [OtherSeven addGestureRecognizer:BlackSeven];
    
    //\\
    
    UITapGestureRecognizer *RedEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Eight:)];
    RedEight.cancelsTouchesInView = YES;
    RedEight.numberOfTapsRequired = 2;
    ObjectEight.userInteractionEnabled = YES;
    [ObjectEight addGestureRecognizer:RedEight];
    
    UITapGestureRecognizer *BlackEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackEight.cancelsTouchesInView = YES;
    BlackEight.numberOfTapsRequired = 1;
    OtherEight.userInteractionEnabled = YES;
    [OtherEight addGestureRecognizer:BlackEight];
    
    //\\
    
    UITapGestureRecognizer *RedNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Nine:)];
    RedNine.cancelsTouchesInView = YES;
    RedNine.numberOfTapsRequired = 2;
    ObjectNine.userInteractionEnabled = YES;
    [ObjectNine addGestureRecognizer:RedNine];
    
    UITapGestureRecognizer *BlackNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackNine.cancelsTouchesInView = YES;
    BlackNine.numberOfTapsRequired = 1;
    OtherNine.userInteractionEnabled = YES;
    [OtherNine addGestureRecognizer:BlackNine];
    
    //Ten\\
    
    UITapGestureRecognizer *RedTen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Ten:)];
    RedTen.cancelsTouchesInView = YES;
    RedTen.numberOfTapsRequired = 2;
    ObjectTen.userInteractionEnabled = YES;
    [ObjectTen addGestureRecognizer:RedTen];
    
    UITapGestureRecognizer *BlackTen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackTen.cancelsTouchesInView = YES;
    BlackTen.numberOfTapsRequired = 1;
    OtherTen.userInteractionEnabled = YES;
    [OtherTen addGestureRecognizer:BlackTen];
    
    //\\
    
    UITapGestureRecognizer *RedEleven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Eleven:)];
    RedEleven.cancelsTouchesInView = YES;
    RedEleven.numberOfTapsRequired = 2;
    ObjectEleven.userInteractionEnabled = YES;
    [ObjectEleven addGestureRecognizer:RedEleven];
    
    UITapGestureRecognizer *BlackEleven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackEleven.cancelsTouchesInView = YES;
    BlackEleven.numberOfTapsRequired = 1;
    OtherEleven.userInteractionEnabled = YES;
    [OtherEleven addGestureRecognizer:BlackEleven];
    
    //\\
    
    UITapGestureRecognizer *RedTwelve = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Twelve:)];
    RedTwelve.cancelsTouchesInView = YES;
    RedTwelve.numberOfTapsRequired = 2;
    ObjectTwelve.userInteractionEnabled = YES;
    [ObjectTwelve addGestureRecognizer:RedTwelve];
    
    UITapGestureRecognizer *BlackTwelve = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackTwelve.cancelsTouchesInView = YES;
    BlackTwelve.numberOfTapsRequired = 1;
    OtherTwelve.userInteractionEnabled = YES;
    [OtherTwelve addGestureRecognizer:BlackTwelve];
    
    //\\
    
    UITapGestureRecognizer *RedThirteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Thirteen:)];
    RedThirteen.cancelsTouchesInView = YES;
    RedThirteen.numberOfTapsRequired = 2;
    ObjectThirteen.userInteractionEnabled = YES;
    [ObjectThirteen addGestureRecognizer:RedThirteen];
    
    UITapGestureRecognizer *BlackThirteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackThirteen.cancelsTouchesInView = YES;
    BlackThirteen.numberOfTapsRequired = 1;
    OtherThirteen.userInteractionEnabled = YES;
    [OtherThirteen addGestureRecognizer:BlackThirteen];
    
    //\\
    
    UITapGestureRecognizer *RedFourteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Fourteen:)];
    RedFourteen.cancelsTouchesInView = YES;
    RedFourteen.numberOfTapsRequired = 2;
    ObjectFourteen.userInteractionEnabled = YES;
    [ObjectFourteen addGestureRecognizer:RedFourteen];
    
    UITapGestureRecognizer *BlackFourteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFourteen.cancelsTouchesInView = YES;
    BlackFourteen.numberOfTapsRequired = 1;
    OtherFourteen.userInteractionEnabled = YES;
    [OtherFourteen addGestureRecognizer:BlackFourteen];
    
    //\\
    
    UITapGestureRecognizer *RedFithteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Fithteen:)];
    RedFithteen.cancelsTouchesInView = YES;
    RedFithteen.numberOfTapsRequired = 2;
    ObjectFithteen.userInteractionEnabled = YES;
    [ObjectFithteen addGestureRecognizer:RedFithteen];
    
    UITapGestureRecognizer *BlackFithteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFithteen.cancelsTouchesInView = YES;
    BlackFithteen.numberOfTapsRequired = 1;
    OtherFithteen.userInteractionEnabled = YES;
    [OtherFithteen addGestureRecognizer:BlackFithteen];
    
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
        ObjectOne.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectTwo.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectThree.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectFour.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectFive.image= [UIImage imageNamed:@"RedButton.png"];
        ObjectSix.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectSeven.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectEight.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectNine.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectTen.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectEleven.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"RedButton.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        ObjectOne.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectTwo.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectThree.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectFour.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectFive.image= [UIImage imageNamed:@"SharpYellow.png"];
        ObjectSix.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectSeven.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectEight.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectNine.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectTen.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectEleven.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"SharpYellow.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        ObjectOne.image = [UIImage imageNamed:@"Pink.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Pink.png"];
        ObjectThree.image = [UIImage imageNamed:@"Pink.png"];
        ObjectFour.image = [UIImage imageNamed:@"Pink.png"];
        ObjectFive.image= [UIImage imageNamed:@"Pink.png"];
        ObjectSix.image = [UIImage imageNamed:@"Pink.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Pink.png"];
        ObjectEight.image = [UIImage imageNamed:@"Pink.png"];
        ObjectNine.image = [UIImage imageNamed:@"Pink.png"];
        ObjectTen.image = [UIImage imageNamed:@"Pink.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Pink.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Pink.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Pink.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Pink.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        ObjectOne.image = [UIImage imageNamed:@"Green.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Green.png"];
        ObjectThree.image = [UIImage imageNamed:@"Green.png"];
        ObjectFour.image = [UIImage imageNamed:@"Green.png"];
        ObjectFive.image= [UIImage imageNamed:@"Green.png"];
        ObjectSix.image = [UIImage imageNamed:@"Green.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Green.png"];
        ObjectEight.image = [UIImage imageNamed:@"Green.png"];
        ObjectNine.image = [UIImage imageNamed:@"Green.png"];
        ObjectTen.image = [UIImage imageNamed:@"Green.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Green.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Green.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Green.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Green.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        ObjectOne.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectTwo.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectThree.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectFour.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectFive.image= [UIImage imageNamed:@"GreenForest.png"];
        ObjectSix.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectSeven.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectEight.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectNine.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectTen.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectEleven.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"GreenForest.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        ObjectOne.image = [UIImage imageNamed:@"Brown.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Brown.png"];
        ObjectThree.image = [UIImage imageNamed:@"Brown.png"];
        ObjectFour.image = [UIImage imageNamed:@"Brown.png"];
        ObjectFive.image= [UIImage imageNamed:@"Brown.png"];
        ObjectSix.image = [UIImage imageNamed:@"Brown.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Brown.png"];
        ObjectEight.image = [UIImage imageNamed:@"Brown.png"];
        ObjectNine.image = [UIImage imageNamed:@"Brown.png"];
        ObjectTen.image = [UIImage imageNamed:@"Brown.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Brown.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Brown.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Brown.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Brown.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        ObjectOne.image = [UIImage imageNamed:@"Purple.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Purple.png"];
        ObjectThree.image = [UIImage imageNamed:@"Purple.png"];
        ObjectFour.image = [UIImage imageNamed:@"Purple.png"];
        ObjectFive.image= [UIImage imageNamed:@"Purple.png"];
        ObjectSix.image = [UIImage imageNamed:@"Purple.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Purple.png"];
        ObjectEight.image = [UIImage imageNamed:@"Purple.png"];
        ObjectNine.image = [UIImage imageNamed:@"Purple.png"];
        ObjectTen.image = [UIImage imageNamed:@"Purple.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Purple.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Purple.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Purple.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Purple.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        ObjectOne.image = [UIImage imageNamed:@"Blue.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Blue.png"];
        ObjectThree.image = [UIImage imageNamed:@"Blue.png"];
        ObjectFour.image = [UIImage imageNamed:@"Blue.png"];
        ObjectFive.image= [UIImage imageNamed:@"Blue.png"];
        ObjectSix.image = [UIImage imageNamed:@"Blue.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Blue.png"];
        ObjectEight.image = [UIImage imageNamed:@"Blue.png"];
        ObjectNine.image = [UIImage imageNamed:@"Blue.png"];
        ObjectTen.image = [UIImage imageNamed:@"Blue.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Blue.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Blue.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Blue.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Blue.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        ObjectOne.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectTwo.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectThree.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectFour.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectFive.image= [UIImage imageNamed:@"BlueSky.png"];
        ObjectSix.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectSeven.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectEight.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectNine.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectTen.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectEleven.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"BlueSky.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        ObjectOne.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectThree.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectFour.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectFive.image= [UIImage imageNamed:@"Turquoise.png"];
        ObjectSix.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectEight.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectNine.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectTen.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Turquoise.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        ObjectOne.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectThree.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectFour.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectFive.image= [UIImage imageNamed:@"Cyan.png"];
        ObjectSix.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectEight.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectNine.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectTen.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Cyan.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        ObjectOne.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectThree.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectFour.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectFive.image= [UIImage imageNamed:@"Fuchsia.png"];
        ObjectSix.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectEight.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectNine.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectTen.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Fuchsia.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        ObjectOne.image = [UIImage imageNamed:@"Lime.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Lime.png"];
        ObjectThree.image = [UIImage imageNamed:@"Lime.png"];
        ObjectFour.image = [UIImage imageNamed:@"Lime.png"];
        ObjectFive.image= [UIImage imageNamed:@"Lime.png"];
        ObjectSix.image = [UIImage imageNamed:@"Lime.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Lime.png"];
        ObjectEight.image = [UIImage imageNamed:@"Lime.png"];
        ObjectNine.image = [UIImage imageNamed:@"Lime.png"];
        ObjectTen.image = [UIImage imageNamed:@"Lime.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Lime.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Lime.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Lime.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Lime.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        ObjectOne.image = [UIImage imageNamed:@"Violet.png"];
        ObjectTwo.image = [UIImage imageNamed:@"Violet.png"];
        ObjectThree.image = [UIImage imageNamed:@"Violet.png"];
        ObjectFour.image = [UIImage imageNamed:@"Violet.png"];
        ObjectFive.image= [UIImage imageNamed:@"Violet.png"];
        ObjectSix.image = [UIImage imageNamed:@"Violet.png"];
        ObjectSeven.image = [UIImage imageNamed:@"Violet.png"];
        ObjectEight.image = [UIImage imageNamed:@"Violet.png"];
        ObjectNine.image = [UIImage imageNamed:@"Violet.png"];
        ObjectTen.image = [UIImage imageNamed:@"Violet.png"];
        ObjectEleven.image = [UIImage imageNamed:@"Violet.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"Violet.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"Violet.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"Violet.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        ObjectOne.image = [UIImage imageNamed:@"White.png"];
        ObjectTwo.image = [UIImage imageNamed:@"White.png"];
        ObjectThree.image = [UIImage imageNamed:@"White.png"];
        ObjectFour.image = [UIImage imageNamed:@"White.png"];
        ObjectFive.image= [UIImage imageNamed:@"White.png"];
        ObjectSix.image = [UIImage imageNamed:@"White.png"];
        ObjectSeven.image = [UIImage imageNamed:@"White.png"];
        ObjectEight.image = [UIImage imageNamed:@"White.png"];
        ObjectNine.image = [UIImage imageNamed:@"White.png"];
        ObjectTen.image = [UIImage imageNamed:@"White.png"];
        ObjectEleven.image = [UIImage imageNamed:@"White.png"];
        ObjectTwelve.image = [UIImage imageNamed:@"White.png"];
        ObjectThirteen.image = [UIImage imageNamed:@"White.png"];
        ObjectFourteen.image = [UIImage imageNamed:@"White.png"];
        ObjectFithteen.image = [UIImage imageNamed:@"White.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
