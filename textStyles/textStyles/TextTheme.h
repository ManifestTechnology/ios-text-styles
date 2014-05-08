//
//  TextTheme.h
//  textStyles
//
//  Created by Trey Baugher on 4/28/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TextTheme <NSObject>

+ (UIFont*)mainTextFont;

+ (UIColor*)mainTextColor;

+ (UIColor*)element1Color;

+ (UIColor*)element2Color;

+ (CGPoint)element1InitialOffset;

+ (CGPoint)element1Offset;

+ (CGPoint)element2InitialOffset;

+ (CGPoint)element2Offset;

+ (int)element1Amount;

+ (int)element2Amount;

/*
 if this returns yes then draw order is (element1,element2,element1,element2)
 if this returns no then draw order is (element1,element1,etc...,element2,element2,etc...)
 */
+ (BOOL)alternateElements;

@end

@interface TextTheme : NSObject

+ (Class)textThemeForNumber:(int)number;

@end
