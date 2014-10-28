//
//  APPViewController.m
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "APPViewController.h"
#import "Info Page.h"
#import <AdSupport/ASIdentifierManager.h>
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

BOOL GameCenterAvaliable;

@interface APPViewController () <NSObject>
{
    IBOutlet UIImageView *Slider;
    IBOutlet UIImageView *Options;
}
@property (strong, readonly) NSUUID *advertisingIdentifier;

@end

@implementation APPViewController

#pragma mark Banner

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


#pragma Mark Button

-(IBAction)StartClassic:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    [StartClassic setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartClassic setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Classic) withObject:nil afterDelay:0.3];
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Classic
{
    [ClassicImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [ClassicImage setAlpha:1];
    [UIView commitAnimations];
    
    StartClassic.hidden = YES;
    ClassicEasy.hidden = NO;
    ClassicMedium.hidden = NO;
    ClassicHard.hidden = NO;
    ClassicImage.hidden = NO;
}

-(IBAction)StartZen:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    [StartZen setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartZen setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Zen) withObject:nil afterDelay:0.3];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Zen
{
    [ZenImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [ZenImage setAlpha:1];
    [UIView commitAnimations];
    
    StartZen.hidden = YES;
    ZenEasy.hidden = NO;
    ZenMedium.hidden = NO;
    ZenHard.hidden = NO;
    ZenImage.hidden = NO;
}

-(IBAction)StartSurvival:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    [StartSurvival setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartSurvival setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Survival) withObject:nil afterDelay:0.3];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;

    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Survival
{
    [SurvivalImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [SurvivalImage setAlpha:1];
    [UIView commitAnimations];
    
    StartSurvival.hidden = YES;
    SurvivalEasy.hidden = NO;
    SurvivalMedium.hidden = NO;
    SurvivalHard.hidden = NO;
    SurvivalImage.hidden = NO;
}

-(IBAction)StartMayhem:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    [StartMayhem setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartMayhem setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Mayhem) withObject:nil afterDelay:0.3];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartReverse.hidden = NO;
    [StartReverse setAlpha:1];
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Mayhem
{
    [MayhemImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [MayhemImage setAlpha:1];
    [UIView commitAnimations];
    
    StartMayhem.hidden = YES;
    MayhemEasy.hidden = NO;
    MayhemMedium.hidden = NO;
    MayhemHard.hidden = NO;
    MayhemImage.hidden = NO;
}

-(IBAction)StartReverse:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    [StartReverse setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartReverse setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Reverse) withObject:nil afterDelay:0.3];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Reverse
{
    [ReverseImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [ReverseImage setAlpha:1];
    [UIView commitAnimations];
    
    StartReverse.hidden = YES;
    ReverseEasy.hidden = NO;
    ReverseMedium.hidden = NO;
    ReverseHard.hidden = NO;
    ReverseImage.hidden = NO;
}

-(IBAction)StartTransfer:(id)sender
{
    
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    [StartTransfer setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartTransfer setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Transfer) withObject:nil afterDelay:0.3];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Transfer
{
    [TransferImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [TransferImage setAlpha:1];
    [UIView commitAnimations];
    
    StartTransfer.hidden = YES;
    TransferEasy.hidden = NO;
    TransferMedium.hidden = NO;
    TransferHard.hidden = NO;
    TransferImage.hidden = NO;
}

-(IBAction)Relentless:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    [StartRelentless setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartRelentless setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Relentless) withObject:nil afterDelay:0.3];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Relentless
{
    [RelentlessImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [RelentlessImage setAlpha:1];
    [UIView commitAnimations];
    
    StartRelentless.hidden = YES;
    RelentlessEasy.hidden = NO;
    RelentlessMedium.hidden = NO;
    RelentlessHard.hidden = NO;
    RelentlessImage.hidden = NO;
}

-(IBAction)Imitation:(id)sender
{
     [StartClassic setAlpha:1];
     [StartZen setAlpha:1];
     [StartSurvival setAlpha:1];
     [StartMayhem setAlpha:1];
     [StartReverse setAlpha:1];
     [StartTransfer setAlpha:1];
     [StartRelentless setAlpha:1];
     [StartImitation setAlpha:1];
     [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    [StartImitation setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartImitation setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(Imitation) withObject:nil afterDelay:0.3];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)Imitation
{
    [ImitationImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [ImitationImage setAlpha:1];
    [UIView commitAnimations];
    
    StartImitation.hidden = YES;
    ImitationEasy.hidden = NO;
    ImitationMedium.hidden = NO;
    ImitationHard.hidden = NO;
    ImitationImage.hidden = NO;
}

-(IBAction)DuoPlayer:(id)sender
{
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    [StartDuo setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartDuo setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(DuoPlayer) withObject:nil afterDelay:0.3];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)DuoPlayer
{
    [DuoImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [DuoImage setAlpha:1];
    [UIView commitAnimations];
    
    StartDuo.hidden = YES;
    DuoEasy.hidden = NO;
    DuoMedium.hidden = NO;
    DuoHard.hidden = NO;
    DuoImage.hidden = NO;
}

-(IBAction)Trans:(id)sender
{
    
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
    
    [StartTrans setAlpha:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.00];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [StartTrans setAlpha:0];
    [UIView commitAnimations];
    [self performSelector:@selector(trans) withObject:nil afterDelay:0.3];
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;

    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
}

-(void)trans
{
    [TransImage setAlpha:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [TransImage setAlpha:1];
    [UIView commitAnimations];
    
    StartTrans.hidden = YES;
    TransEasy.hidden = NO;
    TransMedium.hidden = NO;
    TransHard.hidden = NO;
    TransImage.hidden = NO;
}

-(IBAction)Developer:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/MNMooney"]];
}

#pragma Mark VIiews


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
    
    UITouch *Drag = [[event allTouches] anyObject];
    CGPoint CurrentPosition = [Drag locationInView:self.view];
    CurrentPosition.y = Options.center.y;
    Options.center = CurrentPosition;
    
    int P1, P2, P3;
    
    if (IDIOM == IPAD) {
        P1 = Options.center.x;
        P2 = P1 + 450;
        P3 = P1 + 240;
    } else {
    P1 = Options.center.x;
    P2 = P1 + 200;
    P3 = P1 + 140;
    }
    
    GameCenter.center = CGPointMake(P3, GameCenter.center.y);
    GameHelp.center = CGPointMake(P3, GameHelp.center.y);
    Buttons.center = CGPointMake(P3, Buttons.center.y);
    BackGroundChooser.center = CGPointMake(P3, BackGroundChooser.center.y);
    Developer.center = CGPointMake(P3, Developer.center.y);
    Slider.center = CGPointMake(P2, Slider.center.y);
    
    if (IDIOM == IPAD) {
        if (Options.center.x > 715) {
            Options.image = [UIImage imageNamed:@"PutTheSliderOutImageRedone"];
            Options.center = CGPointMake(715, Options.center.y);
            Slider.center = CGPointMake(1515, Slider.center.y);
            GameCenter.center = CGPointMake(955, GameCenter.center.y);
            GameHelp.center = CGPointMake(955, GameHelp.center.y);
            Buttons.center = CGPointMake(955, Buttons.center.y);
            BackGroundChooser.center = CGPointMake(955, BackGroundChooser.center.y);
            Developer.center = CGPointMake(955, Developer.center.y);
        } else if (Options.center.x < 330) {
            Options.image = [UIImage imageNamed:@"TheSliderBackImage"];
            Options.center = CGPointMake(330, Options.center.y);
            Slider.center = CGPointMake(780, Slider.center.y);
            GameCenter.center = CGPointMake(567, GameCenter.center.y);
            GameHelp.center = CGPointMake(567, GameHelp.center.y);
            Buttons.center = CGPointMake(567, Buttons.center.y);
            BackGroundChooser.center = CGPointMake(567, BackGroundChooser.center.y);
            Developer.center = CGPointMake(567, Developer.center.y);
        }
    } else {
    if (Options.center.x < 96) {
        Options.image = [UIImage imageNamed:@"TheSliderBackImage"];
        Options.center = CGPointMake(96, Options.center.y);
        Slider.center = CGPointMake(296, Slider.center.y);
        GameCenter.center = CGPointMake(236, GameCenter.center.y);
        GameHelp.center = CGPointMake(236, GameHelp.center.y);
        Buttons.center = CGPointMake(236, Buttons.center.y);
        BackGroundChooser.center = CGPointMake(236, BackGroundChooser.center.y);
        Developer.center = CGPointMake(236, Developer.center.y);
    } else if (Options.center.x > 282) {
        Options.image = [UIImage imageNamed:@"PutTheSliderOutImageRedone"];
        Options.center = CGPointMake(282, Options.center.y);
        }
    }
}

- (void)viewDidLoad
{
    Options.userInteractionEnabled = YES;
    
    [self Blur:Slider];
    [self authentication];
    Banner.hidden = NO;
    
    [StartClassic setAlpha:1];
    [StartZen setAlpha:1];
    [StartSurvival setAlpha:1];
    [StartMayhem setAlpha:1];
    [StartReverse setAlpha:1];
    [StartTransfer setAlpha:1];
    [StartRelentless setAlpha:1];
    [StartImitation setAlpha:1];
    [StartDuo setAlpha:1];
    [StartTrans setAlpha:1];
    
    StartClassic.hidden = NO;
    ClassicEasy.hidden = YES;
    ClassicMedium.hidden = YES;
    ClassicHard.hidden = YES;
    ClassicImage.hidden = YES;
    
    StartZen.hidden = NO;
    ZenEasy.hidden = YES;
    ZenMedium.hidden = YES;
    ZenHard.hidden = YES;
    ZenImage.hidden = YES;
    
    StartSurvival.hidden = NO;
    SurvivalEasy.hidden = YES;
    SurvivalMedium.hidden = YES;
    SurvivalHard.hidden = YES;
    SurvivalImage.hidden = YES;
    
    StartMayhem.hidden = NO;
    MayhemEasy.hidden = YES;
    MayhemMedium.hidden = YES;
    MayhemHard.hidden = YES;
    MayhemImage.hidden = YES;
    
    StartReverse.hidden = NO;
    ReverseEasy.hidden = YES;
    ReverseMedium.hidden = YES;
    ReverseHard.hidden = YES;
    ReverseImage.hidden = YES;
    
    StartTransfer.hidden = NO;
    TransferEasy.hidden = YES;
    TransferMedium.hidden = YES;
    TransferHard.hidden = YES;
    TransferImage.hidden = YES;
    
    StartRelentless.hidden = NO;
    RelentlessEasy.hidden = YES;
    RelentlessMedium.hidden = YES;
    RelentlessHard.hidden = YES;
    RelentlessImage.hidden = YES;
    
    StartImitation.hidden = NO;
    ImitationEasy.hidden = YES;
    ImitationMedium.hidden = YES;
    ImitationHard.hidden = YES;
    ImitationImage.hidden = YES;
    
    StartDuo.hidden = NO;
    DuoEasy.hidden = YES;
    DuoMedium.hidden = YES;
    DuoHard.hidden = YES;
    DuoImage.hidden = YES;
    
    StartTrans.hidden = NO;
    TransEasy.hidden = YES;
    TransMedium.hidden = YES;
    TransHard.hidden = YES;
    TransImage.hidden = YES;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TheButton = [[NSUserDefaults standardUserDefaults] integerForKey:@"TheButtonIsSaved"];
    TheBackGround = [[NSUserDefaults standardUserDefaults] integerForKey:@"TheBackGroundIsSaved"];
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)authentication
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                NSLog(@"authentication succcesful");
                GameCenterAvaliable = YES;
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                NSLog(@"authentication unseuccseful");
                GameCenterAvaliable = NO;
            }
        }
    };
}

//Show Gmae center its self within the game

-(IBAction)ShowGameCenter:(id)sender
{
    GKLeaderboardViewController *LeaderboardController = [[GKLeaderboardViewController alloc] init];
    if (LeaderboardController != nil) {
        LeaderboardController.leaderboardDelegate = self;
        [self presentModalViewController:LeaderboardController animated:YES];
    }
}

//Animate gc out if finished with it

-(void)leaderboardViewControllerDidFinish: (GKLeaderboardViewController *) viewController{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)Blur:(UIView *)view {
    UIView *blurView = nil;
    
    if([UIBlurEffect class]) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]; //Can do dark, light or extra light here
        blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurView.frame = view.frame;
        
    } else {
        blurView = [[UIToolbar alloc] initWithFrame:view.bounds];
    }
    
    [blurView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [view addSubview:blurView];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blurView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(blurView)]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[blurView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(blurView)]];
}

@end
