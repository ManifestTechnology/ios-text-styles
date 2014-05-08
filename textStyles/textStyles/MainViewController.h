//
//  MainViewController.h
//  textStyles
//
//  Created by Trey Baugher on 4/24/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet NSLayoutConstraint* kbViewHeight;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint* barHeight;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint* textLeftPadding;
@property (nonatomic, strong) IBOutlet UILabel* button1Label;
@property (nonatomic, strong) IBOutlet UILabel* button2Label;
@property (nonatomic, strong) IBOutlet UILabel* button3Label;
@property (nonatomic, strong) IBOutlet UILabel* button4Label;
@property (nonatomic, strong) IBOutlet UIView* style0TopView;
@property (nonatomic, strong) IBOutlet UIView* style1TopView;
@property (nonatomic, strong) IBOutlet UIView* style2TopView;
@property (nonatomic, strong) IBOutlet UIView* style3TopView;
@property (nonatomic, strong) IBOutlet UIView* style0UnderView;
@property (nonatomic, strong) IBOutlet UIView* style1UnderView;
@property (nonatomic, strong) IBOutlet UIView* style2UnderView;
@property (nonatomic, strong) IBOutlet UIView* style3UnderView;
@property (nonatomic, strong) IBOutlet UITextView* mainTextField;
@property (nonatomic, strong) IBOutlet UILabel* selectLabel;
@property (nonatomic, strong) IBOutlet UIView* textStyleView;

@property (nonatomic, assign) int selectedButtonNum;

-(IBAction)style0Tapped:(id)sender;
-(IBAction)style1Tapped:(id)sender;
-(IBAction)style2Tapped:(id)sender;
-(IBAction)style3Tapped:(id)sender;

@end
