//
//  DuoRelentless.m
//  Quicky Tap
//
//  Created by Michael Mooney on 19/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "DuoRelentless.h"
#define degreesToRadian(x) (M_PI * (x) / 180.0)

double CountOne, CountTwo;
BOOL PlayerOne, PlayerTwo;

@interface DuoRelentless ()
{
    IBOutlet UILabel *InGameScoreOne, *InGameScoreTwo, *InGameCounterOne, *InGameCounterTwo;
    IBOutlet UILabel *PlayerOneWait, *PlayertwoWait, *PlayerOneOne, *PlayerOneTwo, *PlayerTwoOne, *PlayerTwoTwo;
    IBOutlet UIImageView *Barrier, *DisplyOne, *DisplyTwo;
    IBOutlet UIButton *ReplayOne, *HomeOne, *ReplayTwo, *HomeTwo;
    IBOutlet UILabel *POS, *PTS, *P1, *P2;
    IBOutlet UIImageView *BackGroundTwo;
    NSTimer *One, *Two;
}
@end

@implementation DuoRelentless

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)TapOne:(UITapGestureRecognizer *)sender
{
    ScoreOne = ScoreOne + 1;
    InGameScoreOne.text = [NSString stringWithFormat:@"Score: %i", ScoreOne];
    [One invalidate];
    self->One = nil;
    
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
    [Two invalidate];
    self->Two = nil;
    
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

-(void)GameOne
{
    One = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(CounterOne) userInfo:nil repeats:YES];
}


-(void)GameTwo
{
    Two = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(CounterTwo) userInfo:nil repeats:YES];
}

-(void)CounterOne
{
    CountOne = CountOne - 0.01;
    InGameCounterOne.text = [NSString stringWithFormat:@"%.2f", CountOne];
    if (0 > CountOne) {
        PlayerOne = YES;
        [self EndGame];
    }
}

-(void)CounterTwo
{
    CountTwo = CountTwo - 0.01;
    InGameCounterTwo.text = [NSString stringWithFormat:@"%.2f", CountTwo];
    if (0 > CountTwo) {
        PlayerTwo = YES;
        [self EndGame];
    }
}

-(void)EndGame
{
    if (PlayerOne == YES && PlayerTwo == NO) {
        PlayerOneWait.hidden = NO;
        RedButtonOne.hidden = YES;
        InGameCounterOne.hidden = YES;
        [One invalidate];
        self->One = nil;
    } else if (PlayerOne == NO && PlayerTwo == YES) {
        PlayertwoWait.hidden = NO;
        RedButtonTwo.hidden = YES;
        InGameCounterTwo.hidden = YES;
        [Two invalidate];
        self->Two = nil;
    } else if (PlayerOne == YES && PlayerTwo == YES) {
        [Two invalidate];
        self->Two = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        [One invalidate];
        self->One = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        [self Compare];
    }
}

-(void)Compare
{
    PlayerOneWait.hidden = YES;
    PlayertwoWait.hidden = YES;
    InGameCounterOne.hidden = YES;
    InGameCounterTwo.hidden = YES;
    InGameScoreOne.hidden = YES;
    InGameScoreTwo.hidden = YES;
    RedButtonOne.hidden = YES;
    RedButtonTwo.hidden = YES;
    PlayerOneWait.hidden = YES;
    PlayertwoWait.hidden = YES;
    PlayerOneOne.hidden = NO;
    PlayerOneTwo.hidden = NO;
    PlayerTwoOne.hidden = NO;
    PlayerTwoTwo.hidden = NO;
    P1.hidden = YES;
    P2.hidden = YES;
    Replay.hidden = NO;
    Home.hidden = NO;
    POS.hidden = NO;
    DisplyOne.hidden = NO;
    DisplyTwo.hidden = NO;
    PTS.hidden = NO;
    
    PlayerOneOne.text = [NSString stringWithFormat:@"%i", ScoreOne];
    PlayerOneTwo.text = [NSString stringWithFormat:@"%i", ScoreTwo];
    
    PlayerTwoOne.text = [NSString stringWithFormat:@"%i", ScoreOne];
    PlayerTwoTwo.text = [NSString stringWithFormat:@"%i", ScoreTwo];

    if (ScoreOne > ScoreTwo) {
        DisplyOne.image = [UIImage imageNamed:@"PlayerOneWins.png"];
        DisplyTwo.image = [UIImage imageNamed:@"PlayerOneWins.png"];
        HomeOne.hidden = NO;
        ReplayOne.hidden = NO;
    } else if (ScoreTwo > ScoreOne) {
        DisplyOne.image = [UIImage imageNamed:@"PlayerTwoWins.png"];
        DisplyTwo.image = [UIImage imageNamed:@"PlayerTwoWins.png"];
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
        DisplyOne.image = [UIImage imageNamed:@"ItsADraw.png"];
        DisplyTwo.image = [UIImage imageNamed:@"ItsADraw.png"];
    }
}

-(void)viewDidLoad
{
    CountOne = 25;
    CountTwo = 25;
    ScoreOne = 0;
    ScoreTwo = 0;
    PlayerOne = NO;
    PlayerTwo = NO;
    Barrier.hidden = NO;
    DisplyOne.hidden = YES;
    DisplyTwo.hidden = YES;
    PlayerOneOne.hidden = YES;
    PlayerOneTwo.hidden = YES;
    PlayerTwoOne.hidden = YES;
    PlayerTwoTwo.hidden = YES;
    ReplayOne.hidden = YES;
    HomeOne.hidden = YES;
    ReplayTwo.hidden = YES;
    HomeTwo.hidden = YES;
    
    [Two invalidate];
    self->Two = nil;
    [One invalidate];
    self->One = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    PlayerOneWait.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    InGameScoreOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    InGameCounterOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    P1.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    DisplyOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    HomeOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    ReplayOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    PlayerOneOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    PlayerOneTwo.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    RedButtonOne.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    BackGroundTwo.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
    
    UITapGestureRecognizer *TapOne= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapOne:)];
    TapOne.cancelsTouchesInView = YES;
    TapOne.numberOfTapsRequired = 1;
    RedButtonOne.userInteractionEnabled = YES;
    [RedButtonOne addGestureRecognizer:TapOne];
    
    UITapGestureRecognizer *TapTwo= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTwo:)];
    TapTwo.cancelsTouchesInView = YES;
    TapTwo.numberOfTapsRequired = 1;
    RedButtonTwo.userInteractionEnabled = YES;
    [RedButtonTwo addGestureRecognizer:TapTwo];
    
    Replay.hidden = YES;
    Home.hidden = YES;
    Display.hidden = YES;
    PTS.hidden = YES;
    POS.hidden = YES;
    PlayerOneWait.hidden = YES;
    PlayertwoWait.hidden = YES;
    
    [super viewDidLoad];
    
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
        RedButtonOne.image = [UIImage imageNamed:@"RedButton.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        RedButtonOne.image = [UIImage imageNamed:@"SharpYellow.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        RedButtonOne.image = [UIImage imageNamed:@"Pink.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        RedButtonOne.image = [UIImage imageNamed:@"Green.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        RedButtonOne.image = [UIImage imageNamed:@"GreenForest.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        RedButtonOne.image = [UIImage imageNamed:@"Brown.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        RedButtonOne.image = [UIImage imageNamed:@"Purple.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        RedButtonOne.image = [UIImage imageNamed:@"Blue.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        RedButtonOne.image = [UIImage imageNamed:@"BlueSky.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        RedButtonOne.image = [UIImage imageNamed:@"Turquoise.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        RedButtonOne.image = [UIImage imageNamed:@"Cyan.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        RedButtonOne.image = [UIImage imageNamed:@"Fuchsia.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        RedButtonOne.image = [UIImage imageNamed:@"Lime.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        RedButtonOne.image = [UIImage imageNamed:@"Violet.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        RedButtonOne.image = [UIImage imageNamed:@"White.png"];
        RedButtonTwo.image = [UIImage imageNamed:@"White.png"];
    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
