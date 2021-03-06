//
//  ImitationClassic.h
//  Quicky Tap
//
//  Created by Michael Mooney on 13/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

int ButtonPressed;
float Counter;
int Place;
double HighScoreNumber;

@interface ImitationClassic : UIViewController <ADBannerViewDelegate>
{
    ADBannerView *Banner;

    IBOutlet UIImageView *Display, *Dead, *BackGround;
    
    IBOutlet UIButton *Home, *Replay;
    
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
    
    IBOutlet UIButton *RedTouch, *OtherTouchOne, *OtherTouchTwo, *OtherTouchThree, *OtherTouchFour, *OtherTouchFive, *OtherTouchSix, *OtherTouchSeven, *OtherTouchEight, *OtherTouchNine, *OtherTouchTen, *OtherTouchEleven;
    
    NSTimer *ClassicEasyTimer;
    
    IBOutlet UILabel *HighScore, *LastScore, *InGameScore, *InGameCounter;
}

@end
