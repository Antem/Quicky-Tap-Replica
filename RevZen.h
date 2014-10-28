//
//  RevZen.h
//  Quicky Tap
//
//  Created by Michael Mooney on 01/08/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

int ButtonPressed, Place;
float Time;
NSInteger HighScoreNum;

@interface RevZen : UIViewController <ADBannerViewDelegate>
{
    IBOutlet ADBannerView *Banner;
    
    IBOutlet UIImageView *Display, *DeadMessage;
    
    IBOutlet UIButton *Home, *Replay;
    
    IBOutlet UIButton *RedTouch, *OtherTouchOne, *OtherTouchTwo, *OtherTouchThree, *OtherTouchFour, *OtherTouchFive, *OtherTouchSix, *OtherTouchSeven, *OtherTouchEight, *OtherTouchNine, *OtherTouchTen, *OtherTouchEleven;
    
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven;
    
    NSTimer *Timer;
    
    IBOutlet UILabel *HighScore, *LastScore, *InGameThing;
}

@end