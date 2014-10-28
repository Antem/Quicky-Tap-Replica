//
//  SurvivalMedium.h
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "Info Page.h"

int LevelNumber, Lives, ButtonPressed, Place;

NSInteger HighScoreNumber;

@interface SurvivalMedium : UIViewController <ADBannerViewDelegate>
{
    IBOutlet UIImageView *Display, *BackGround;
    
    IBOutlet ADBannerView *Banner;
    
    IBOutlet UIButton *Home, *Replay;
    
    IBOutlet UILabel *InGameScore, *HighScore, *LastScore, *InGameLives;
    
    IBOutlet UIButton *RedTouch, *OtherTouchOne, *OtherTouchTwo, *OtherTouchThree, *OtherTouchFour, *OtherTouchFive, *OtherTouchSix, *OtherTouchSeven, *OtherTouchEight, *OtherTouchNine, *OtherTouchTen, *OtherTouchEleven;
    
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
    
    NSTimer *Switch;
}
@end
