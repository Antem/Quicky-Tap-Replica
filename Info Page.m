//
//  Info Page.m
//  Quicky Tap
//
//  Created by Michael Mooney on 29/07/2014.
//  Copyright (c) 2014 Michael Mooney. All rights reserved.
//

#import "Info Page.h"

NSInteger Counter;

@interface Info_Page ()
{
    IBOutlet UIButton *B1, *B2, *B3, *B4, *B5, *B6, *B7, *B8, *B9, *B10, *B11, *B12, *B13, *B14, *B15, *B16, *B17, *B18, *B19, *B20, *B21, *B22, *B23, *B24, *B25, *B26, *B27, *B28, *B29, *B30, *B31, *B32, *B33, *B34, *B35, *B36;
}
@property (strong, nonatomic)IBOutlet UIPageControl *PageControl;
@end

@implementation Info_Page

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

// - - - Help Messages In Game - - - \\

-(IBAction)Mayhem:(id)sender
{
    NSString *Myhm = @"You have to hit all the red buttons as fast as you can. When you hit a red button it goes black, so don't tap it twice!";
    
    UIAlertView *MyhmAlert = [[UIAlertView alloc] initWithTitle:@"Mayhem Help" message:Myhm delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [MyhmAlert show];
}

-(IBAction)Classic:(id)sender
{
    NSString *Class = @"You have a certain amount of buttons, to tap as fast as you can. Easy - 15, Medium - 30 and, hard - 60.";
    
    UIAlertView *ClassAlert = [[UIAlertView alloc] initWithTitle:@"Classic Help" message:Class delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [ClassAlert show];
}

-(IBAction)Zen:(id)sender
{
    NSString *Zen = @"You have a certain amount of time to tap as much buttons as you can. If you tap a black button before the timer runs out, you keep the same score.";
    
    UIAlertView *ZnAlert = [[UIAlertView alloc] initWithTitle:@"Zen Help" message:Zen delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [ZnAlert show];
}

-(IBAction)Transfer:(id)sender
{
    NSString *Trans = @"You have a certain amount of time, to tap a number of buttons. If you don't tap the buttons fast enough, the game will be over. However if you do tap all the buttons in time, the timer will restart.";
    
    UIAlertView *TransAlert = [[UIAlertView alloc] initWithTitle:@"Transfer Help" message:Trans delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [TransAlert show];
}

-(IBAction)Survival:(id)sender
{
    NSString *Sur = @"You are given a set amount of lives (4, 3, 2), and you have to tap the button as many times as you can. If you hit a black button you lose a life, until you run out of lives! If you don't tap a button fast enough, you also lose a life.";
    
    UIAlertView *SurAlert = [[UIAlertView alloc] initWithTitle:@"Survival Help" message:Sur delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [SurAlert show];
}

-(IBAction)Reverse:(id)sender
{
    NSString *Rev = @"You have to tap the black this time. If you tap your selected button, the game will be over. Each reverse game mode, will be the same as the selected medium mode, eg reverse classic is classic medium but you tap the black button.";
    
    UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Reverse Help" message:Rev delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [RevAlert show];
}

-(IBAction)Relentless:(id)sender
{
    NSString *Relent = @"You have one big red button in the middle of the screen. You have to tap it as many times as you can before the timer runs out (you can use more than one finger!).";
    
    UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Relentless Help" message:Relent delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [RevAlert show];
}

-(IBAction)Imitation:(id)sender
{
    NSString *Rev = @"What ever game mode you have choosen in imitation, you have to tap your selected button twice, however you only have to tap the black button once.";
    
    UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Imitataion Help" message:Rev delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [RevAlert show];
}

-(IBAction)Duo:(id)sender
{
    NSString *Rev = @"Two Player game mode! Its almost as same as your selected game mode, but its been resized to fit the screen!";
    
    UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Duo-Player Help" message:Rev delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [RevAlert show];
}

-(IBAction)Trans:(id)sender
{
    NSString *Rev = @"Hardest game mode in the game! You have a certain amount of time to tap a certain amount of buttons. If you think your a fast tapper, this is the game mode for you!";
    
    UIAlertView *RevAlert = [[UIAlertView alloc] initWithTitle:@"Transcendence Help" message:Rev delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [RevAlert show];
}

// - - - Views - - - \\

- (void)viewDidLoad
{
    TheBackGround = [[NSUserDefaults standardUserDefaults] integerForKey:@"TheBackGroundIsSaved"];
    TheButton = [[NSUserDefaults standardUserDefaults] integerForKey:@"TheButtonIsSaved"];
    
    UISwipeGestureRecognizer *SwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Left:)];
    SwipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:SwipeLeft];
    
    UISwipeGestureRecognizer *SwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Right:)];
    SwipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:SwipeRight];
    
    _PageControl.numberOfPages = 4;
    _PageControl.currentPage = 0;
    
    [super viewDidLoad];
    
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

// - - - Buttons - - - \\

-(IBAction)ButtonOne:(id)sender
{
    TheButton = 1;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
    
}

-(IBAction)ButtonTwo:(id)sender
{
    TheButton = 2;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonThree:(id)sender
{
    TheButton = 3;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonFour:(id)sender
{
    TheButton = 4;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonFive:(id)sender
{
    TheButton = 5;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonSix:(id)sender
{
    TheButton = 6;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonSeven:(id)sender
{
    TheButton = 7;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonEight:(id)sender
{
    TheButton = 8;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonNine:(id)sender
{
    TheButton = 9;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonTen:(id)sender
{
    TheButton = 10;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonEleven:(id)sender
{
    TheButton = 11;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonTwelve:(id)sender
{
    TheButton = 12;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonThirteen:(id)sender
{
    TheButton = 13;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonFourteen:(id)sender
{
    TheButton = 14;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

-(IBAction)ButtonFithteen:(id)sender
{
    TheButton = 15;
    [[NSUserDefaults standardUserDefaults] setInteger:TheButton forKey:@"TheButtonIsSaved"];
}

// - - - BackGround - - - \\

-(void)Left: (UISwipeGestureRecognizer *)swiper
{
    NSLog(@"Left");
    Counter = Counter + 1;
    
    if (Counter > 4) {
        Counter = 1;
    } else if (Counter < 1) {
        Counter = 4;
    }
    
    if (Counter == 1) {
        _PageControl.currentPage = 0;
        B1.hidden = NO, B2.hidden = NO, B3.hidden = NO, B4.hidden = NO, B5.hidden = NO, B6.hidden = NO, B7.hidden = NO, B8.hidden = NO, B9.hidden = NO;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
    } else if (Counter == 2) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = NO, B11.hidden = NO, B12.hidden = NO, B13.hidden = NO, B14.hidden = NO, B15.hidden = NO, B16.hidden = NO, B17.hidden = NO, B18.hidden = NO;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
        _PageControl.currentPage = 1;
    } else if (Counter == 3) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = NO, B20.hidden = NO, B21.hidden = NO, B22.hidden = NO, B23.hidden = NO, B24.hidden = NO, B25.hidden = NO, B26.hidden = NO, B27.hidden = NO;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
        _PageControl.currentPage = 2;
    } else if (Counter == 4) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = NO, B29.hidden = NO, B30.hidden = NO, B31.hidden = NO, B32.hidden = NO, B33.hidden = NO, B34.hidden = NO, B35.hidden = NO, B36.hidden = NO;
        _PageControl.currentPage = 3;
    }
}

-(void)Right: (UISwipeGestureRecognizer *)swiper
{
    NSLog(@"Right");
    
    Counter = Counter - 1;
    
    if (Counter > 4) {
        Counter = 1;
    } else if (Counter < 1) {
        Counter = 4;
    }
    
    if (Counter == 1) {
        _PageControl.currentPage = 0;
        B1.hidden = NO, B2.hidden = NO, B3.hidden = NO, B4.hidden = NO, B5.hidden = NO, B6.hidden = NO, B7.hidden = NO, B8.hidden = NO, B9.hidden = NO;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
    } else if (Counter == 2) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = NO, B11.hidden = NO, B12.hidden = NO, B13.hidden = NO, B14.hidden = NO, B15.hidden = NO, B16.hidden = NO, B17.hidden = NO, B18.hidden = NO;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
        _PageControl.currentPage = 1;
    } else if (Counter == 3) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = NO, B20.hidden = NO, B21.hidden = NO, B22.hidden = NO, B23.hidden = NO, B24.hidden = NO, B25.hidden = NO, B26.hidden = NO, B27.hidden = NO;
        B28.hidden = YES, B29.hidden = YES, B30.hidden = YES, B31.hidden = YES, B32.hidden = YES, B33.hidden = YES, B34.hidden = YES, B35.hidden = YES, B36.hidden = YES;
        _PageControl.currentPage = 2;
    } else if (Counter == 4) {
        B1.hidden = YES, B2.hidden = YES, B3.hidden = YES, B4.hidden = YES, B5.hidden = YES, B6.hidden = YES, B7.hidden = YES, B8.hidden = YES, B9.hidden = YES;
        B10.hidden = YES, B11.hidden = YES, B12.hidden = YES, B13.hidden = YES, B14.hidden = YES, B15.hidden = YES, B16.hidden = YES, B17.hidden = YES, B18.hidden = YES;
        B19.hidden = YES, B20.hidden = YES, B21.hidden = YES, B22.hidden = YES, B23.hidden = YES, B24.hidden = YES, B25.hidden = YES, B26.hidden = YES, B27.hidden = YES;
        B28.hidden = NO, B29.hidden = NO, B30.hidden = NO, B31.hidden = NO, B32.hidden = NO, B33.hidden = NO, B34.hidden = NO, B35.hidden = NO, B36.hidden = NO;
        _PageControl.currentPage = 3;
    }
}

-(IBAction)BG1:(id)sender
{
    TheBackGround = 1;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Forest-Snow.png"];
}

-(IBAction)BG2:(id)sender
{
    TheBackGround = 2;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petal-Violet.png"];
}

-(IBAction)BG3:(id)sender
{
    TheBackGround = 3;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petal-Orange.png"];
}

-(IBAction)BG4:(id)sender
{
    TheBackGround = 4;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Apple-Wallpaper.png"];
}

-(IBAction)BG5:(id)sender
{
    TheBackGround = 5;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petal-VP.png"];
}

-(IBAction)BG6:(id)sender
{
    TheBackGround = 6;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petal-White.png"];
}

-(IBAction)BG7:(id)sender
{
    TheBackGround = 7;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Night-Image.png"];
}

-(IBAction)BG8:(id)sender
{
    TheBackGround = 8;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Yosimite.png"];
}

-(IBAction)BG9:(id)sender
{
    TheBackGround = 9;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petal-Purple.png"];
}

-(IBAction)BG10:(id)sender
{
    TheBackGround = 10;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Petel-Green.png"];
}

-(IBAction)BG11:(id)sender
{
    TheBackGround = 11;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"apple.png"];
}

-(IBAction)BG12:(id)sender
{
    TheBackGround = 12;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Blue-CreamBG.png"];
}

-(IBAction)BG13:(id)sender
{
    TheBackGround = 13;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Blue-Green-WhiteBG.png"];
}

-(IBAction)BG14:(id)sender
{
    TheBackGround = 14;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Blue-WhiteBG.png"];
}

-(IBAction)BG15:(id)sender
{
    TheBackGround = 15;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"ColdJaggyBG.png"];
}

-(IBAction)BG16:(id)sender
{
    TheBackGround = 16;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"DesetDarkBG.png"];
}

-(IBAction)BG17:(id)sender
{
    TheBackGround = 17;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"GrassBG.png"];
}

-(IBAction)BG18:(id)sender
{
    TheBackGround = 18;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Green-BlueBG.png"];
}

-(IBAction)BG19:(id)sender
{
    TheBackGround = 19;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"GreenBG.png"];
}

-(IBAction)BG20:(id)sender
{
    TheBackGround = 20;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"LakeForestBG.png"];
}

-(IBAction)BG21:(id)sender
{
    TheBackGround = 21;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"MultiWaveBG.png"];
}

-(IBAction)BG22:(id)sender
{
    TheBackGround = 22;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"OrangeFlowers.png"];
}

-(IBAction)BG23:(id)sender
{
    TheBackGround = 23;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"PartyBG.png"];
}

-(IBAction)BG24:(id)sender
{
    TheBackGround = 24;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"Purple-WhiteBG.png"];
}

-(IBAction)BG25:(id)sender
{
    TheBackGround = 25;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"WarmJaggyBG.png"];
}

-(IBAction)BG26:(id)sender
{
    TheBackGround = 26;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"WaterFlowBG.png"];
}

-(IBAction)BG27:(id)sender
{
    TheBackGround = 27;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"nightimage?.png"];
}

-(IBAction)BG28:(id)sender
{
    TheBackGround = 28;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"rainforest.png"];
}

-(IBAction)BG29:(id)sender
{
    TheBackGround = 29;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"earth.png"];
}

-(IBAction)BG30:(id)sender
{
    TheBackGround = 30;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"SunDown.png"];
}

-(IBAction)BG31:(id)sender
{
    TheBackGround = 31;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"CoolBackGrond.png"];
}

-(IBAction)BG32:(id)sender
{
    TheBackGround = 32;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"BigHomeScreen.png"];
}

-(IBAction)BG33:(id)sender
{
    TheBackGround = 33;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"WaterPic.png"];
}

-(IBAction)BG34:(id)sender
{
    TheBackGround = 34;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"SplitBG.png"];
}

-(IBAction)BG35:(id)sender
{
    TheBackGround = 35;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"northenlights.png"];
}

-(IBAction)BG36:(id)sender
{
    TheBackGround = 36;
    [[NSUserDefaults standardUserDefaults] setInteger:TheBackGround forKey:@"TheBackGroundIsSaved"];
    BackGround.image = [UIImage imageNamed:@"GoldSkyBG.png"];
}

@end
