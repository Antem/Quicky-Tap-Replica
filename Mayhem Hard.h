//
//  Mayhem Hard.h
//  Quicky Tap
//
//  Created by Michael Mooney on 30/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

BOOL GameOver;

@interface Mayhem_Hard : UIViewController <ADBannerViewDelegate>
{
    IBOutlet ADBannerView *Banner;
    
    IBOutlet UIImageView *RedButton, *OtherButtonOne, *OtherButtonTwo, *OtherButtonThree, *OtherButtonFour, *OtherButtonFive, *OtherButtonSix, *OtherButtonSeven, *OtherButtonEight, *OtherButtonNine, *OtherButtonTen, *OtherButtonEleven, *OtherButtonTwelve, *OtherButtonThirteen, *OtherButtonFourteen, *OtherButtonFithteen;
    
    IBOutlet UIButton *RedOne, *RedTwo, *RedThree, *RedFour, *RedFive, *RedSix, *RedSeven, *RedEight, *RedNine, *RedTen, *RedEleven, *RedTwelve, *RedThirteen, *RedFourteen, *RedFithteen;
    
    IBOutlet UIButton *BlackOne, *BlackTwo, *BlackThree, *BlackFour, *BlackFive, *BlackSix, *BlackSeven, *BlackEight, *BlackNine, *BlackTen, *BlackEleven, *BlackTwelve, *BlackThirteen, *BlackFourteen, *BlackFithteen;
}

-(IBAction)RedButton:(id)sender;
-(IBAction)BlackButton:(id)sender;

@end
