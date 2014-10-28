//
//  SurvivalEasy.h
//  Quicky Tap
//
//  Created by Michael Mooney on 10/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

int LevelNumber, Lives, ButtonPressed, Place;

NSInteger HighScoreNumber;

@interface SurvivalEasy : UIViewController <ADBannerViewDelegate>
{
    IBOutlet UIImageView *Display, *BackGround;
    
    IBOutlet ADBannerView *Banner;
    
    IBOutlet UIButton *Home, *Replay;
    
    IBOutlet UILabel *InGameScore, *HighScore, *LastScore;
    
    NSTimer *Switch;
}

@end
