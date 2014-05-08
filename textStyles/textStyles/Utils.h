//
//  Utils.h
//  textStyles
//
//  Created by Trey Baugher on 4/29/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (float)iPadModifier;
+ (BOOL)doesTextOverflowView:(UITextView*)textView;
+ (BOOL)willEditOverflowView:(UITextView*)textView string:(NSString*)textString range:(NSRange)textRange;
+ (NSString*)trimStringToFitRect:(CGRect)rect inset:(CGFloat)inset string:(NSString*)string font:(UIFont*)font;


@end
