//
//  RelentlessMedium.h
//  Quicky Tap
//
//  Created by Michael Mooney on 13/10/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Info Page.h"

double Counter;
NSInteger Score, HighScoreNumber;

@interface RelentlessMedium : UIViewController
{
    IBOutlet UIButton *Home, *Replay;
    IBOutlet UIImageView *BackGround, *RedButton, *Display;
    IBOutlet UILabel *LastScore, *HighScore, *InGameCounter, *InGameScore;
    NSTimer *Timer;
}
@end
