//
//  Mayhem Hard.m
//  Quicky Tap
//
//  Created by Michael Mooney on 30/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "Mayhem Hard.h"
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "Info Page.h"

float ScoreNumber, ButtonAmount;
double HighScoreNumber;

@interface Mayhem_Hard ()
{
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *Display, *LostDisplay;
    IBOutlet UILabel *HighScoreLbl, *LastScore, *InGameScore;
    IBOutlet UIImageView *BackGround;
    NSTimer *Score;
}

@end

@implementation Mayhem_Hard

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

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


#pragma Mark Other Actions

-(IBAction)ButtonOne:(id)sender
{
    RedOne.hidden = YES;
    BlackOne.hidden = NO;
    OtherButtonOne.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonTwo:(id)sender
{
    RedTwo.hidden = YES;
    BlackTwo.hidden = NO;
    OtherButtonTwo.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonThree:(id)sender
{
    RedThree.hidden = YES;
    BlackThree.hidden = NO;
    OtherButtonThree.image = [UIImage imageNamed:@"BlackButton"];
}

-(IBAction)ButtonFour:(id)sender
{
    RedFour.hidden = YES;
    BlackFour.hidden = NO;
    OtherButtonFour.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonFive:(id)sender
{
    RedFive.hidden = YES;
    BlackFive.hidden = NO;
    OtherButtonFive.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonSix:(id)sender
{
    RedSix.hidden = YES;
    BlackSix.hidden = NO;
    OtherButtonSix.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonSeven:(id)sender
{
    RedSeven.hidden = YES;
    BlackSeven.hidden = NO;
    OtherButtonSeven.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonEight:(id)sender
{
    RedEight.hidden = YES;
    BlackEight.hidden = NO;
    OtherButtonEight.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonNine:(id)sender
{
    RedNine.hidden = YES;
    BlackNine.hidden = NO;
    OtherButtonNine.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonTen:(id)sender
{
    RedTen.hidden = YES;
    BlackTen.hidden = NO;
    OtherButtonTen.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonEleven:(id)sender
{
    RedEleven.hidden = YES;
    BlackEleven.hidden = NO;
    OtherButtonEleven.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonTwelve:(id)sender
{
    RedTwelve.hidden = YES;
    BlackTwelve.hidden = NO;
    OtherButtonTwelve.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonThirteen:(id)sender
{
    RedThirteen.hidden = YES;
    BlackThirteen.hidden = NO;
    OtherButtonThirteen.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonFourteen:(id)sender
{
    RedFourteen.hidden = YES;
    BlackFourteen.hidden = NO;
    OtherButtonFourteen.image = [UIImage imageNamed:@"BlackButton.png"];
}

-(IBAction)ButtonFithteen:(id)sender
{
    RedFithteen.hidden = YES;
    BlackFithteen.hidden = NO;
    OtherButtonFithteen.image = [UIImage imageNamed:@"BlackButton.png"];
}

#pragma Mark Actions

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
}

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
    
    ButtonAmount = ButtonAmount - 1;
    [Score invalidate];
    [self Game];
}

-(IBAction)BlackButton:(id)sender
{
    NSString *over = @"WrongButton";
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:over ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    [self Lost];
}

#pragma Mark The Game

-(void)Lost
{
    [self Fadein];
    GameOver = YES;
    [Score invalidate];
    self->Score = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSLog(@"The Timer has been invalidated");
    Banner.hidden = NO;
    RedOne.hidden = YES; BlackOne.hidden = YES; OtherButtonOne.hidden = YES;
    RedTwo.hidden = YES; BlackTwo.hidden = YES; OtherButtonTwo.hidden = YES;
    RedThree.hidden = YES; BlackThree.hidden = YES; OtherButtonThree.hidden = YES;
    RedFour.hidden = YES; BlackFour.hidden = YES; OtherButtonFour.hidden = YES;
    RedFive.hidden = YES; BlackFive.hidden = YES; OtherButtonFive.hidden = YES;
    RedSix.hidden = YES; BlackSix.hidden = YES; OtherButtonSix.hidden = YES;
    RedSeven.hidden = YES; BlackSeven.hidden = YES; OtherButtonSeven.hidden = YES;
    RedEight.hidden = YES; BlackEight.hidden = YES; OtherButtonEight.hidden = YES;
    RedNine.hidden = YES; BlackNine.hidden = YES; OtherButtonNine.hidden = YES;
    RedTen.hidden = YES; BlackTen.hidden = YES; OtherButtonTen.hidden = YES;
    RedEleven.hidden = YES; BlackEleven.hidden = YES; OtherButtonEleven.hidden = YES;
    RedTwelve.hidden = YES; BlackTwelve.hidden = YES; OtherButtonTwelve.hidden = YES;
    RedThirteen.hidden = YES; BlackThirteen.hidden = YES; OtherButtonThirteen.hidden = YES;
    RedFourteen.hidden = YES; BlackFourteen.hidden = YES; OtherButtonFourteen.hidden = YES;
    RedFithteen.hidden = YES; BlackFithteen.hidden = YES; OtherButtonFithteen.hidden = YES;

    
    HighScoreLbl.hidden = NO;
    LostDisplay.hidden = NO;
    Home.hidden = NO;
    [Score invalidate];
    InGameScore.hidden = YES;
    Replay.hidden = NO;
    
    HighScoreLbl.text = [NSString stringWithFormat:@"%.2f", HighScoreNumber];
    
    ScoreNumber = 0;
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
    GameOver = YES;
    [Score invalidate];
    self->Score = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSLog(@"The Timer has been invalidated");
    Banner.hidden = NO;
    RedOne.hidden = YES; BlackOne.hidden = YES; OtherButtonOne.hidden = YES;
    RedTwo.hidden = YES; BlackTwo.hidden = YES; OtherButtonTwo.hidden = YES;
    RedThree.hidden = YES; BlackThree.hidden = YES; OtherButtonThree.hidden = YES;
    RedFour.hidden = YES; BlackFour.hidden = YES; OtherButtonFour.hidden = YES;
    RedFive.hidden = YES; BlackFive.hidden = YES; OtherButtonFive.hidden = YES;
    RedSix.hidden = YES; BlackSix.hidden = YES; OtherButtonSix.hidden = YES;
    RedSeven.hidden = YES; BlackSeven.hidden = YES; OtherButtonSeven.hidden = YES;
    RedEight.hidden = YES; BlackEight.hidden = YES; OtherButtonEight.hidden = YES;
    RedNine.hidden = YES; BlackNine.hidden = YES; OtherButtonNine.hidden = YES;
    RedTen.hidden = YES; BlackTen.hidden = YES; OtherButtonTen.hidden = YES;
    RedEleven.hidden = YES; BlackEleven.hidden = YES; OtherButtonEleven.hidden = YES;
    RedTwelve.hidden = YES; BlackTwelve.hidden = YES; OtherButtonTwelve.hidden = YES;
    RedThirteen.hidden = YES; BlackThirteen.hidden = YES; OtherButtonThirteen.hidden = YES;
    RedFourteen.hidden = YES; BlackFourteen.hidden = YES; OtherButtonFourteen.hidden = YES;
    RedFithteen.hidden = YES; BlackFithteen.hidden = YES; OtherButtonFithteen.hidden = YES;
    
    Home.hidden = NO;
    [Score invalidate];
    Score = nil;
    Replay.hidden = NO;
    InGameScore.hidden = YES;
    LastScore.hidden = NO;
    Display.hidden = NO;
    HighScoreLbl.hidden = NO;
    
    if (ScoreNumber < HighScoreNumber || HighScoreNumber == 0) {
        HighScoreNumber = ScoreNumber;
        [[NSUserDefaults standardUserDefaults] setDouble:HighScoreNumber forKey:@"HighScoreMayhemHardSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%.2f", ScoreNumber];
    HighScoreLbl.text = [NSString stringWithFormat:@"%.2f", HighScoreNumber];
    
    ScoreNumber = 0;
}

-(void)reportScore
{
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Mayhem_Hard_Leaderboard"];
    int64_t GameCenterScoreTwelve = (int64_t) (HighScoreNumber * 100.00f);
    score.value = GameCenterScoreTwelve;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)Game
{
    if (ButtonAmount == 0) {
        [self EndGame];
    }
    
    Score = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ScoreMethod) userInfo:nil repeats:YES];
}

-(void)ScoreMethod
{
    if (Score == nil) {
        GameOver = YES;
        [self Game];
    } else if (GameOver == YES && ScoreNumber > 0) {
        [Score invalidate];
        self->Score = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        NSLog(@"The Timer has been invalidated");
    }
    ScoreNumber = ScoreNumber + 0.01;
    NSLog(@"Score: %.2f", ScoreNumber);
    InGameScore.text = [NSString stringWithFormat:@"%.2f", ScoreNumber];
}

- (void)viewDidLoad
{
    Banner.hidden = YES;
    GameOver = NO;
    
    OtherButtonOne.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonTwo.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonThree.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonFour.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonFive.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonSix.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonSeven.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonEight.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonNine.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonTen.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonEleven.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonTwelve.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonThirteen.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonFourteen.image = [UIImage imageNamed:@"RedButton.png"];
    OtherButtonFithteen.image = [UIImage imageNamed:@"RedButton.png"];
    
    RedOne.hidden = NO; BlackOne.hidden = YES; OtherButtonOne.hidden = NO;
    RedTwo.hidden = NO; BlackTwo.hidden = YES; OtherButtonTwo.hidden = NO;
    RedThree.hidden = NO; BlackThree.hidden = YES; OtherButtonThree.hidden = NO;
    RedFour.hidden = NO; BlackFour.hidden = YES; OtherButtonFour.hidden = NO;
    RedFive.hidden = NO; BlackFive.hidden = YES; OtherButtonFive.hidden = NO;
    RedSix.hidden = NO; BlackSix.hidden = YES; OtherButtonSix.hidden = NO;
    RedSeven.hidden = NO; BlackSeven.hidden = YES; OtherButtonSeven.hidden = NO;
    RedEight.hidden = NO; BlackEight.hidden = YES; OtherButtonEight.hidden = NO;
    RedNine.hidden = NO; BlackNine.hidden = YES; OtherButtonNine.hidden = NO;
    RedTen.hidden = NO; BlackTen.hidden = YES; OtherButtonTen.hidden = NO;
    RedEleven.hidden = NO; BlackEleven.hidden = YES; OtherButtonEleven.hidden = NO;
    RedTwelve.hidden = NO; BlackTwelve.hidden = YES; OtherButtonTwelve.hidden = NO;
    RedThirteen.hidden = NO; BlackThirteen.hidden = YES; OtherButtonThirteen.hidden = NO;
    RedFourteen.hidden = NO; BlackFourteen.hidden = YES; OtherButtonFourteen.hidden = NO;
    RedFithteen.hidden = NO; BlackFithteen.hidden = YES; OtherButtonFithteen.hidden = NO;
    
    LastScore.hidden = YES;
    HighScoreLbl.hidden = YES;
    Display.hidden = YES;
    InGameScore.hidden = NO;
    LostDisplay.hidden = YES;
    [Score invalidate];
    Home.hidden = YES;
    Replay.hidden = YES;
    
    InGameScore.text = [NSString stringWithFormat:@"0.00"];
    
    ButtonAmount = 15;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] doubleForKey:@"HighScoreMayhemHardSaved"];
    
    [super viewDidLoad];
    
    if (TheButton == 1) {
        RedButton.image = [UIImage imageNamed:@"RedButton.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"RedButton.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"RedButton.png"];
    } else if (TheButton == 2) {
        RedButton.image = [UIImage imageNamed:@"SharpYellow.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"SharpYellow.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"SharpYellow.png"];
    } else if (TheButton == 3) {
        RedButton.image = [UIImage imageNamed:@"Pink.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Pink.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Pink.png"];
    } else if (TheButton == 4) {
        RedButton.image = [UIImage imageNamed:@"Green.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Green.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Green.png"];
    } else if (TheButton == 5) {
        RedButton.image = [UIImage imageNamed:@"GreenForest.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"GreenForest.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"GreenForest.png"];
    } else if (TheButton == 6) {
        RedButton.image = [UIImage imageNamed:@"Brown.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Brown.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Brown.png"];
    } else if (TheButton == 7) {
        RedButton.image = [UIImage imageNamed:@"Purple.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Purple.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Purple.png"];
    } else if (TheButton == 8) {
        RedButton.image = [UIImage imageNamed:@"Blue.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Blue.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Blue.png"];
    } else if (TheButton == 9) {
        RedButton.image = [UIImage imageNamed:@"BlueSky.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"BlueSky.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"BlueSky.png"];
    } else if (TheButton == 10) {
        RedButton.image = [UIImage imageNamed:@"Turquoise.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Turquoise.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Turquoise.png"];
    } else if (TheButton == 11) {
        RedButton.image = [UIImage imageNamed:@"Cyan.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Cyan.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Cyan.png"];
    } else if (TheButton == 12) {
        RedButton.image = [UIImage imageNamed:@"Fuchsia.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Fuchsia.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Fuchsia.png"];
    } else if (TheButton == 13) {
        RedButton.image = [UIImage imageNamed:@"Lime.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Lime.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Lime.png"];
    } else if (TheButton == 14) {
        RedButton.image = [UIImage imageNamed:@"Violet.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"Violet.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"Violet.png"];
    } else if (TheButton == 15) {
        RedButton.image = [UIImage imageNamed:@"White.png"];
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
        OtherButtonTwelve.image = [UIImage imageNamed:@"White.png"];
        OtherButtonThirteen.image = [UIImage imageNamed:@"White.png"];
        OtherButtonFourteen.image = [UIImage imageNamed:@"White.png"];
        OtherButtonFithteen.image = [UIImage imageNamed:@"White.png"];
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
    
    [self Area];
}

-(void)Area
{
    int One, Two, Three;
    
    One = OtherButtonOne.center.x;
    Two = OtherButtonTwo.center.x;
    Three = OtherButtonThree.center.x;
    
    int Four, Five, Six;
    
    Four = OtherButtonOne.center.y;
    Five = OtherButtonFour.center.y;
    Six = OtherButtonSeven.center.y;
    
    int Seven, Eight;
    
    Seven = OtherButtonTen.center.y;
    Eight = OtherButtonThirteen.center.y;
    
    NSLog(@"X axis is: %i, %i, %i", One, Two, Three);
    NSLog(@"Y axis is: %i, %i, %i, %i, %i", Four, Five, Six, Seven, Eight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end