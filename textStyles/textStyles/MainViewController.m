//
//  MainViewController.m
//  textStyles
//
//  Created by Trey Baugher on 4/24/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import "MainViewController.h"
#import "Utils.h"
#import "TextTheme.h"

#define topUnselectedColor [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0]
#define underSelectedColor [UIColor colorWithRed:202/255.0 green:149/255.0 blue:244/255.0 alpha:1.0]
#define topSelectedColor [UIColor colorWithRed:89/255.0 green:44/255.0 blue:127/255.0 alpha:1.0]
#define underUnselectedColor [UIColor colorWithRed:89/255.0 green:44/255.0 blue:127/255.0 alpha:1.0]

@interface MainViewController ()

@end

@implementation MainViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Memory Warning");
}

#pragma mark - View Setup Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //auto-focus on text field so keyboard shows immediately
    [self.mainTextField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setupUI];
}

- (void)setupUI
{
    [self updateContraints];
    
    [self.button1Label setFont:[UIFont systemFontOfSize:30.0 * [Utils iPadModifier]]];
    [self.button2Label setFont:[UIFont systemFontOfSize:30.0 * [Utils iPadModifier]]];
    [self.button3Label setFont:[UIFont systemFontOfSize:30.0 * [Utils iPadModifier]]];
    [self.button4Label setFont:[UIFont systemFontOfSize:30.0 * [Utils iPadModifier]]];
    
    //default selection styling
    self.selectedButtonNum = 1;
    [self styleMainText:1];
    [self fillTextStyleView:1
                  alternate:[[TextTheme textThemeForNumber:1] alternateElements]];
    
}

- (void)updateContraints
{
    [self.kbViewHeight setConstant:self.view.bounds.size.height/2];
    [self.barHeight setConstant:self.barHeight.constant * [Utils iPadModifier]];
    [self.selectLabel setFont:[UIFont systemFontOfSize:28.0 * [Utils iPadModifier]]];
    [self.textLeftPadding setConstant:self.textLeftPadding.constant * [Utils iPadModifier]];
    
    //autolayout
    [self.view layoutIfNeeded];
}

#pragma mark - Text Styling Methods
- (void)styleMainText:(int)style
{
    [self.mainTextField setTextColor:[[TextTheme textThemeForNumber:style] mainTextColor]];
    [self.mainTextField setFont:[[TextTheme textThemeForNumber:style] mainTextFont]];
    
    //clear out the previous style
    [[self.textStyleView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)fillTextStyleView:(int)style alternate:(BOOL)alternate
{
    CGPoint initialPosition1 = [[TextTheme textThemeForNumber:style] element1InitialOffset];
    CGPoint offsetAmount1 = [[TextTheme textThemeForNumber:style] element1Offset];
    CGPoint initialPosition2 = [[TextTheme textThemeForNumber:style] element2InitialOffset];
    CGPoint offsetAmount2 = [[TextTheme textThemeForNumber:style] element2Offset];
    int element1Count = [[TextTheme textThemeForNumber:style] element1Amount] - 1;
    int element2Count = [[TextTheme textThemeForNumber:style] element2Amount] - 1;
    
    float maxPositionX1 = initialPosition1.x + (offsetAmount1.x * element1Count);
    float maxPositionY1 = initialPosition1.y + (offsetAmount1.y * element1Count);
    float maxPositionX2 = initialPosition2.x + (offsetAmount2.x * element2Count);
    float maxPositionY2 = initialPosition2.y + (offsetAmount2.y * element2Count);
    
    float width = CGRectGetWidth(self.mainTextField.bounds);
    float height = CGRectGetHeight(self.mainTextField.bounds);
    
    float baseX = self.mainTextField.frame.origin.x;
    float baseY = self.mainTextField.frame.origin.y;
    
    //add element1
    for (int count=0; count < [[TextTheme textThemeForNumber:style] element1Amount]; count++) {
        /*
         we draw from the max position back in towards the text element, this
         is needed so that alternating element style will display correctly
         */
        float positionX = baseX + maxPositionX1 - (offsetAmount1.x * count);
        float positionY = baseY + maxPositionY1 - (offsetAmount1.y * count);
        [self addElementWithColor:[[TextTheme textThemeForNumber:style] element1Color]
                          andRect:CGRectMake(positionX, positionY, width, height)];
        
        if (alternate) {
            //add element2
            float positionX2 = baseX + maxPositionX2 - (offsetAmount2.x * count);
            float positionY2 = baseY + maxPositionY2 - (offsetAmount2.y * count);
            [self addElementWithColor:[[TextTheme textThemeForNumber:style] element2Color]
                              andRect:CGRectMake(positionX2, positionY2, width, height)];
        }
    }
    
    if (!alternate) {//if alternating then styling is already complete
        //add element2
        for (int count=0; count < [[TextTheme textThemeForNumber:style] element2Amount]; count++) {
            float positionX2 = baseX + maxPositionX2 - (offsetAmount2.x * count);
            float positionY2 = baseY + maxPositionY2 - (offsetAmount2.y * count);
            [self addElementWithColor:[[TextTheme textThemeForNumber:style] element2Color]
                              andRect:CGRectMake(positionX2, positionY2, width, height)];
        }
    }
}

- (void)addElementWithColor:(UIColor*)color andRect:(CGRect)rect
{
    UITextView* element = [[UITextView alloc] initWithFrame:rect];
    [element setUserInteractionEnabled:NO];
    [element setBackgroundColor:[UIColor clearColor]];
    [element setText:self.mainTextField.text];
    [element setFont:self.mainTextField.font];
    [element setTextColor:color];
    [self.textStyleView addSubview:element];
}

#pragma mark - Radio Button Methods
- (IBAction)style0Tapped:(id)sender
{
    [self toggleRadioButtons:0];
}

- (IBAction)style1Tapped:(id)sender
{
    [self toggleRadioButtons:1];
}

- (IBAction)style2Tapped:(id)sender
{
    [self toggleRadioButtons:2];
}

- (IBAction)style3Tapped:(id)sender
{
    [self toggleRadioButtons:3];
}

- (void)toggleRadioButtons:(int)selected
{
    if (self.selectedButtonNum != selected) {//do nothing if tap is on selected button
        [self styleButton:selected forSelected:YES];
        [self styleButton:self.selectedButtonNum forSelected:NO];
        self.selectedButtonNum = selected;
        
        [self styleMainText:selected];

        //check if new style makes text overflow and react if needed
        if ([Utils doesTextOverflowView:self.mainTextField]) {
            NSString* newString = [Utils trimStringToFitRect:self.mainTextField.bounds
                                 inset:8.0f
                                string:self.mainTextField.text
                                  font:self.mainTextField.font];
            
            [self.mainTextField setText:newString];
        }
        
        //once main text string is finalized generate style from it
        [self fillTextStyleView:selected
                      alternate:[[TextTheme textThemeForNumber:selected] alternateElements]];
    }
}

- (void)styleButton:(int)button forSelected:(BOOL)selected
{
    UIColor* topColor;
    UIColor* underColor;
    UIColor* textColor;
    UIColor* textShadowColor;
    
    //set colors for the button state
    if (!selected){
        topColor=topUnselectedColor;
        underColor=underUnselectedColor;
        textColor=[UIColor whiteColor];
        textShadowColor=[UIColor blackColor];
    } else {
        topColor=topSelectedColor;
        underColor=underSelectedColor;
        textColor=[UIColor blackColor];
        textShadowColor=underSelectedColor;
    }
    
    switch (button) {
        case 0:
            [self.style0TopView setBackgroundColor:topColor];
            [self.style0UnderView setBackgroundColor:underColor];
            [self.button1Label setTextColor:textColor];
            [self.button1Label setShadowColor:textShadowColor];
            break;
        case 1:
            [self.style1TopView setBackgroundColor:topColor];
            [self.style1UnderView setBackgroundColor:underColor];
            [self.button2Label setTextColor:textColor];
            [self.button2Label setShadowColor:textShadowColor];
            break;
        case 2:
            [self.style2TopView setBackgroundColor:topColor];
            [self.style2UnderView setBackgroundColor:underColor];
            [self.button3Label setTextColor:textColor];
            [self.button3Label setShadowColor:textShadowColor];
            break;
        case 3:
            [self.style3TopView setBackgroundColor:topColor];
            [self.style3UnderView setBackgroundColor:underColor];
            [self.button4Label setTextColor:textColor];
            [self.button4Label setShadowColor:textShadowColor];
            break;
        default:
            break;
    }
}

#pragma mark - Text View Delegate Methods
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //allowing deletion
    if (text.length == 0){
        return YES;
    }
    
    return [Utils willEditOverflowView:textView string:text range:range];
}

-(void)textViewDidChange:(UITextView *)textView
{
    //restyle when text changes
    [self styleMainText:self.selectedButtonNum];
    [self fillTextStyleView:self.selectedButtonNum
                  alternate:[[TextTheme textThemeForNumber:self.selectedButtonNum] alternateElements]];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return NO;
}

@end
