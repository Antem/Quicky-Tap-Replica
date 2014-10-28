//
//  RevClassic.h
//  Quicky Tap
//
//  Created by Michael Mooney on 01/08/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

int ButtonPressed;
double Counter;
int Place;
double HighScoreNumber;

@interface RevClassic : UIViewController <ADBannerViewDelegate>
{
    ADBannerView *Banner;
    
    IBOutlet UIImageView *Display, *Dead;
    
    IBOutlet UIButton *Home, *Replay;
    
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
    
    IBOutlet UIButton *RedTouch, *OtherTouchOne, *OtherTouchTwo, *OtherTouchThree, *OtherTouchFour, *OtherTouchFive, *OtherTouchSix, *OtherTouchSeven, *OtherTouchEight, *OtherTouchNine, *OtherTouchTen, *OtherTouchEleven;
    
    NSTimer *ClassicEasyTimer;
    
    IBOutlet UILabel *HighScore, *LastScore, *InGameScore;
}

@end