//
//  TextTheme.m
//  textStyles
//
//  Created by Trey Baugher on 4/28/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import "TextTheme.h"
#import "Utils.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface InsetTextTheme : NSObject <TextTheme>
@end

@interface RetroTextTheme : NSObject <TextTheme>
@end

@interface Shaded3DTextTheme : NSObject <TextTheme>
@end

@interface DropShadow3DTextTheme : NSObject <TextTheme>
@end

@implementation TextTheme

+ (Class)textThemeForNumber:(int)number
{
    switch (number) {
        case 0:
            return [InsetTextTheme class];
        case 1:
            return [RetroTextTheme class];
        case 2:
            return [Shaded3DTextTheme class];
        case 3:
            return [DropShadow3DTextTheme class];
        default:
            return [DropShadow3DTextTheme class];
    }
}

@end

@implementation InsetTextTheme

+ (UIFont*)mainTextFont
{
    return [UIFont fontWithName:@"Arvo" size:58.5f * [Utils iPadModifier]];
}

+ (UIColor*)mainTextColor
{
    return RGB(162, 162, 162);
}

+ (UIColor*)element1Color//highlight
{
    return RGB(253, 253, 253);
}

+ (UIColor*)element2Color//shadow
{
    return RGB(120, 120, 120);
}

+ (CGPoint)element1InitialOffset
{
    return CGPointMake(0.5, 0.5);
}

+ (CGPoint)element1Offset
{
    return CGPointMake(0.5, 0.5);
}

+ (CGPoint)element2InitialOffset
{
    return CGPointMake(-0.5, -0.5);
}

+ (CGPoint)element2Offset
{
    return CGPointMake(-0.5, -0.5);
}

+ (int)element1Amount
{
    return 2 * [Utils iPadModifier];
}

+ (int)element2Amount
{
    return 2 * [Utils iPadModifier];
}

+ (BOOL)alternateElements
{
    return NO;
}

@end

@implementation RetroTextTheme

+ (UIFont*)mainTextFont
{
    return [UIFont fontWithName:@"RobotoCondensed-Italic" size:57.0f * [Utils iPadModifier]];
}

+ (UIColor*)mainTextColor
{
    return RGB(85, 182, 233);
}

+ (UIColor*)element1Color//shadow
{
    return RGB(228, 177, 236);
}

+ (UIColor*)element2Color//bg colored divider (simulated transparency)
{
    return RGB(217, 217, 217);
}

+ (CGPoint)element1InitialOffset
{
    return CGPointMake(-3*[Utils iPadModifier], 2*[Utils iPadModifier]);
}

+ (CGPoint)element1Offset
{
    return CGPointMake(-0.5, 0.5);
}

+ (CGPoint)element2InitialOffset
{
    return CGPointMake(-2*[Utils iPadModifier], 1*[Utils iPadModifier]);
}

+ (CGPoint)element2Offset
{
    return CGPointMake(0, 0);//not used
}

+ (int)element1Amount
{
    return 3 * [Utils iPadModifier];
}

+ (int)element2Amount
{
    return 1 * [Utils iPadModifier];
}

+ (BOOL)alternateElements
{
    return NO;
}

@end


@implementation Shaded3DTextTheme

+ (UIFont*)mainTextFont
{
    return [UIFont fontWithName:@"Nunito-Bold" size:59.0f * [Utils iPadModifier]];
}

+ (UIColor*)mainTextColor
{
    return RGB(255, 165, 0);
}

+ (UIColor*)element1Color//bottom side (dark)
{
    return RGB(255, 91, 34);
}

+ (UIColor*)element2Color//left side (bright)
{
    return RGB(255, 212, 60);
}

+ (CGPoint)element1InitialOffset
{
    return CGPointMake(0, 1);
}

+ (CGPoint)element1Offset
{
    return CGPointMake(-0.5, 0.5);
}

+ (CGPoint)element2InitialOffset
{
    return CGPointMake(-1, 0);
}

+ (CGPoint)element2Offset
{
    return CGPointMake(-0.5, 0.5);
}

+ (int)element1Amount
{
    return 5 * [Utils iPadModifier];
}

+ (int)element2Amount
{
    return 5 * [Utils iPadModifier];
}

+ (BOOL)alternateElements
{
    return YES;
}

@end


@implementation DropShadow3DTextTheme

+ (UIFont*)mainTextFont
{
    return [UIFont fontWithName:@"Montserrat-Bold" size:57.75f * [Utils iPadModifier]];
}

+ (UIColor*)mainTextColor
{
    return RGB(70, 230, 0);
}

+ (UIColor*)element1Color//drop shadow
{
    return RGB(180, 190, 210);
}

+ (UIColor*)element2Color//text side
{
    return RGB(15, 175, 0);
}

+ (CGPoint)element1InitialOffset
{
    return CGPointMake(-2*[Utils iPadModifier], 3.25*[Utils iPadModifier]);
}

+ (CGPoint)element1Offset
{
    return CGPointMake(1.5, 0.5);
}

+ (CGPoint)element2InitialOffset
{
    return CGPointMake(-0.5, 0.5);
}

+ (CGPoint)element2Offset
{
    return CGPointMake(-0.5, 0.5);
}

+ (int)element1Amount
{
    return 5 * [Utils iPadModifier];
}

+ (int)element2Amount
{
    return 5 * [Utils iPadModifier];
}

+ (BOOL)alternateElements
{
    return NO;
}

@end