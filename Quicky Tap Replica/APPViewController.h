//
//  APPViewController.h
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <iAd/iAd.h>

@interface APPViewController : UIViewController <ADBannerViewDelegate>
{
    IBOutlet ADBannerView *Banner;
    
    IBOutlet UIButton *StartClassic, *ClassicEasy, *ClassicMedium, *ClassicHard;
    IBOutlet UIButton *StartZen, *ZenEasy, *ZenMedium, *ZenHard;
    IBOutlet UIButton *StartSurvival, *SurvivalEasy, *SurvivalMedium, *SurvivalHard;
    IBOutlet UIButton *StartMayhem, *MayhemEasy, *MayhemMedium, *MayhemHard;
    IBOutlet UIButton *StartReverse, *ReverseEasy, *ReverseMedium, *ReverseHard;
    IBOutlet UIButton *StartTransfer, *TransferEasy, *TransferMedium, *TransferHard;
    IBOutlet UIButton *StartRelentless, *RelentlessEasy, *RelentlessMedium, *RelentlessHard;
    IBOutlet UIButton *StartImitation, *ImitationEasy, *ImitationMedium, *ImitationHard;
    IBOutlet UIButton *StartDuo, *DuoEasy, *DuoMedium, *DuoHard;
    IBOutlet UIButton *StartTrans, *TransEasy, *TransMedium, *TransHard;
    
    IBOutlet UIButton *GameHelp, *GameCenter, *Buttons, *BackGroundChooser, *Developer;
    
    IBOutlet UIImageView *ClassicImage, *ZenImage, *SurvivalImage, *MayhemImage, *ReverseImage, *TransferImage, *RelentlessImage, *ImitationImage, *DuoImage, *TransImage;
    
    IBOutlet UIImageView *BackGround;
}

@end
