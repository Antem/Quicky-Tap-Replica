//
//  ImitationZen.m
//  Quicky Tap
//
//  Created by Michael Mooney on 13/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "ImitationZen.h"
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>
#import "Info Page.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface ImitationZen ()
{
    IBOutlet UILabel *InGameCounter;
    IBOutlet UIImageView *OtherButtonTwelve, *OtherButtonThirteen, *OtherButtonFourteen;
}
@end

@implementation ImitationZen

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

-(IBAction)Replay:(id)sender
{
    [self viewDidLoad];
}

-(void)Red:(UITapGestureRecognizer *)sender
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
    NSLog(@"Score: %i", ButtonPressed);
    [Timer invalidate];
    Timer = nil;
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
    
    [self EndGame];
    [Timer invalidate];
    Timer = nil;
}

//Game

-(void)Game
{
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Score) userInfo:nil repeats:YES];
    
    InGameCounter.text = [NSString stringWithFormat:@"Score: %i", ButtonPressed];
    
    Place = arc4random_uniform(15);
    
    switch (Place) {
        case 1:
            if (IDIOM == IPAD) {
                RedButton.center = CGPointMake(120, 200);
                OtherButtonOne.center = CGPointMake(384, 200);
                OtherButtonTwo.center = CGPointMake(627, 200);
                OtherButtonThree.center = CGPointMake(120, 383);
                OtherButtonFour.center = CGPointMake(384, 383);
                OtherButtonFive.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                RedButton.center = CGPointMake(55, 113);
                OtherButtonOne.center = CGPointMake(160, 113);
                OtherButtonTwo.center = CGPointMake(265, 113);
                OtherButtonThree.center = CGPointMake(55, 213);
                OtherButtonFour.center = CGPointMake(160, 213);
                OtherButtonFive.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 2:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                RedButton.center = CGPointMake(384, 200);
                OtherButtonTwo.center = CGPointMake(627, 200);
                OtherButtonThree.center = CGPointMake(120, 383);
                OtherButtonFour.center = CGPointMake(384, 383);
                OtherButtonFive.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                RedButton.center = CGPointMake(160, 113);
                OtherButtonTwo.center = CGPointMake(265, 113);
                OtherButtonThree.center = CGPointMake(55, 213);
                OtherButtonFour.center = CGPointMake(160, 213);
                OtherButtonFive.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 3:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                RedButton.center = CGPointMake(627, 200);
                OtherButtonThree.center = CGPointMake(120, 383);
                OtherButtonFour.center = CGPointMake(384, 383);
                OtherButtonFive.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                RedButton.center = CGPointMake(265, 113);
                OtherButtonThree.center = CGPointMake(55, 213);
                OtherButtonFour.center = CGPointMake(160, 213);
                OtherButtonFive.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 4:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                RedButton.center = CGPointMake(120, 383);
                OtherButtonFour.center = CGPointMake(384, 383);
                OtherButtonFive.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                RedButton.center = CGPointMake(55, 213);
                OtherButtonFour.center = CGPointMake(160, 213);
                OtherButtonFive.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 5:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                RedButton.center = CGPointMake(384, 383);
                OtherButtonFive.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                RedButton.center = CGPointMake(160, 213);
                OtherButtonFive.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 6:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                RedButton.center = CGPointMake(627, 383);
                OtherButtonSix.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                RedButton.center = CGPointMake(265, 213);
                OtherButtonSix.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 7:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                RedButton.center = CGPointMake(120, 566);
                OtherButtonSeven.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                RedButton.center = CGPointMake(55, 313);
                OtherButtonSeven.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 8:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                RedButton.center = CGPointMake(384, 566);
                OtherButtonEight.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                RedButton.center = CGPointMake(160, 313);
                OtherButtonEight.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 9:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                RedButton.center = CGPointMake(627, 566);
                OtherButtonNine.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                RedButton.center = CGPointMake(265, 313);
                OtherButtonNine.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 10:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                RedButton.center = CGPointMake(120, 749);
                OtherButtonTen.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                RedButton.center = CGPointMake(55, 413);
                OtherButtonTen.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 11:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                OtherButtonTen.center = CGPointMake(120, 749);
                RedButton.center = CGPointMake(384, 749);
                OtherButtonEleven.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                OtherButtonTen.center = CGPointMake(55, 413);
                RedButton.center = CGPointMake(160, 413);
                OtherButtonEleven.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 12:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                OtherButtonTen.center = CGPointMake(120, 749);
                OtherButtonEleven.center = CGPointMake(384, 749);
                RedButton.center = CGPointMake(627, 749);
                OtherButtonTwelve.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                OtherButtonTen.center = CGPointMake(55, 413);
                OtherButtonEleven.center = CGPointMake(160, 413);
                RedButton.center = CGPointMake(265, 413);
                OtherButtonTwelve.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 13:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                OtherButtonTen.center = CGPointMake(120, 749);
                OtherButtonEleven.center = CGPointMake(384, 749);
                OtherButtonTwelve.center = CGPointMake(627, 749);
                RedButton.center = CGPointMake(120, 934);
                OtherButtonThirteen.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                OtherButtonTen.center = CGPointMake(55, 413);
                OtherButtonEleven.center = CGPointMake(160, 413);
                OtherButtonTwelve.center = CGPointMake(265, 413);
                RedButton.center = CGPointMake(55, 513);
                OtherButtonThirteen.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 14:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                OtherButtonTen.center = CGPointMake(120, 749);
                OtherButtonEleven.center = CGPointMake(384, 749);
                OtherButtonTwelve.center = CGPointMake(627, 749);
                OtherButtonThirteen.center = CGPointMake(120, 934);
                RedButton.center = CGPointMake(384, 934);
                OtherButtonFourteen.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                OtherButtonTen.center = CGPointMake(55, 413);
                OtherButtonEleven.center = CGPointMake(160, 413);
                OtherButtonTwelve.center = CGPointMake(265, 413);
                OtherButtonThirteen.center = CGPointMake(55, 513);
                RedButton.center = CGPointMake(160, 513);
                OtherButtonFourteen.center = CGPointMake(265, 513);
            }
            break;
        case 15:
            if (IDIOM == IPAD) {
                OtherButtonOne.center = CGPointMake(120, 200);
                OtherButtonTwo.center = CGPointMake(384, 200);
                OtherButtonThree.center = CGPointMake(627, 200);
                OtherButtonFour.center = CGPointMake(120, 383);
                OtherButtonFive.center = CGPointMake(384, 383);
                OtherButtonSix.center = CGPointMake(627, 383);
                OtherButtonSeven.center = CGPointMake(120, 566);
                OtherButtonEight.center = CGPointMake(384, 566);
                OtherButtonNine.center = CGPointMake(627, 566);
                OtherButtonTen.center = CGPointMake(120, 749);
                OtherButtonEleven.center = CGPointMake(384, 749);
                OtherButtonTwelve.center = CGPointMake(627, 749);
                OtherButtonThirteen.center = CGPointMake(120, 934);
                OtherButtonFourteen.center = CGPointMake(384, 934);
                RedButton.center = CGPointMake(627, 934);
            } else {
                OtherButtonOne.center = CGPointMake(55, 113);
                OtherButtonTwo.center = CGPointMake(160, 113);
                OtherButtonThree.center = CGPointMake(265, 113);
                OtherButtonFour.center = CGPointMake(55, 213);
                OtherButtonFive.center = CGPointMake(160, 213);
                OtherButtonSix.center = CGPointMake(265, 213);
                OtherButtonSeven.center = CGPointMake(55, 313);
                OtherButtonEight.center = CGPointMake(160, 313);
                OtherButtonNine.center = CGPointMake(265, 313);
                OtherButtonTen.center = CGPointMake(55, 413);
                OtherButtonEleven.center = CGPointMake(160, 413);
                OtherButtonTwelve.center = CGPointMake(265, 413);
                OtherButtonThirteen.center = CGPointMake(55, 513);
                OtherButtonFourteen.center = CGPointMake(160, 513);
                RedButton.center = CGPointMake(265, 513);
            }
            break;
        default:
            break;
    }
}

-(void)Score
{
    Time = Time - 0.01;
    NSLog(@"Time: %.2f", Time);
    InGameThing.text = [NSString stringWithFormat:@"%.2f", Time];
    if (Time <= 0) {
        [self EndGame];
        [Timer invalidate];
        Timer = nil;
    }
    if (Timer == nil) {
        NSLog(@"The Timer had been invalidated");
    }
}

-(void)reportScore
{
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"Imitation_Zen_Leaderboard"];
    int64_t GameCenterScoreTwentyTwo = HighScoreNum;
    score.value = GameCenterScoreTwentyTwo;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
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
    
    Display.hidden = NO;
    Home.hidden = NO;
    Replay.hidden = NO;
    LastScore.hidden = NO;
    HighScore.hidden = NO;
    InGameCounter.hidden = YES;
    InGameThing.hidden = YES;
    
    
    if (ButtonPressed > HighScoreNum) {
        HighScoreNum = ButtonPressed;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNum forKey:@"HighScoreImitataionZenSaved"];
    }
    [self reportScore];
    LastScore.text = [NSString stringWithFormat:@"%i", ButtonPressed];
    HighScore.text = [NSString stringWithFormat:@"%li", (long)HighScoreNum];
    
    
    RedButton.hidden = YES, OtherButtonOne.hidden = YES, OtherButtonTwo.hidden = YES, OtherButtonThree.hidden = YES, OtherButtonFour.hidden = YES, OtherButtonFive.hidden = YES, OtherButtonSix.hidden = YES, OtherButtonSeven.hidden = YES, OtherButtonEight.hidden = YES, OtherButtonNine.hidden = YES, OtherButtonTen.hidden = YES, OtherButtonEleven.hidden = YES;
    OtherButtonTwelve.hidden = YES, OtherButtonThirteen.hidden = YES, OtherButtonFourteen.hidden = YES;
    RedTouch.hidden = YES, OtherTouchOne.hidden = YES, OtherTouchTwo.hidden = YES, OtherTouchThree.hidden = YES, OtherTouchFour.hidden = YES, OtherTouchFive.hidden = YES, OtherTouchSix.hidden = YES, OtherTouchSeven.hidden = YES, OtherTouchEight.hidden = YES, OtherTouchNine.hidden = YES, OtherTouchTen.hidden = YES, OtherTouchEleven.hidden = YES;
}

- (void)viewDidLoad
{
    Time = 60;
    ButtonPressed = 0;
    
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
    
    UITapGestureRecognizer *Red= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red:)];
    Red.cancelsTouchesInView = YES;
    Red.numberOfTapsRequired = 2;
    RedButton.userInteractionEnabled = YES;
    [RedButton addGestureRecognizer:Red];
    
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
    
    UITapGestureRecognizer *BlackTwelve= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackTwelve.cancelsTouchesInView = YES;
    BlackTwelve.numberOfTapsRequired = 1;
    OtherButtonTwelve.userInteractionEnabled = YES;
    [OtherButtonTwelve addGestureRecognizer:BlackTwelve];
    
    UITapGestureRecognizer *BlackThirteen= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackThirteen.cancelsTouchesInView = YES;
    BlackThirteen.numberOfTapsRequired = 1;
    OtherButtonThirteen.userInteractionEnabled = YES;
    [OtherButtonThirteen addGestureRecognizer:BlackThirteen];
    
    UITapGestureRecognizer *BlackFourteen= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Black:)];
    BlackFourteen.cancelsTouchesInView = YES;
    BlackFourteen.numberOfTapsRequired = 1;
    OtherButtonFourteen.userInteractionEnabled = YES;
    [OtherButtonFourteen addGestureRecognizer:BlackFourteen];
    
    [super viewDidLoad];
    
    HighScoreNum = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreImitataionZenSaved"];
    
    if (HighScoreNum == 0) {
        NSString *Zen = @"You have a 60 seconds to tap as much buttons as you can. If you tap a black button before the timer runs out, you keep the same score however the game is over. You also need to tap the red button twice very fast, but you only tap a black button once for the game to be over!";
        UIAlertView *ZnAlert = [[UIAlertView alloc] initWithTitle:@"Imitation Zen Help" message:Zen delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [ZnAlert show];
    }
    
    HighScore.hidden = YES;
    LastScore.hidden = YES;
    InGameThing.hidden = NO;
    Display.hidden = YES;
    Home.hidden = YES;
    Replay.hidden = YES;
    DeadMessage.hidden = YES;
    
    InGameThing.text = [NSString stringWithFormat:@"%.2f", Time];
    InGameCounter.text = [NSString stringWithFormat:@"Score: %i", ButtonPressed];
    
    RedButton.hidden = NO, OtherButtonOne.hidden = NO, OtherButtonTwo.hidden = NO, OtherButtonThree.hidden = NO, OtherButtonFour.hidden = NO, OtherButtonFive.hidden = NO, OtherButtonSix.hidden = NO, OtherButtonSeven.hidden = NO, OtherButtonEight.hidden = NO, OtherButtonNine.hidden = NO, OtherButtonTen.hidden = NO, OtherButtonEleven.hidden = NO;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
