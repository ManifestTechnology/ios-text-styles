//
//  Utils.m
//  textStyles
//
//  Created by Trey Baugher on 4/29/14.
//  Copyright (c) 2014 Manifest Digital. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (float)iPadModifier
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )//checking if the device is an ipad
    {
        return 2.0f;
    } else {
        return 1.0f;
    }
}

+ (BOOL)doesTextOverflowView:(UITextView*)textView
{
    CGSize textSize = [textView sizeThatFits:CGSizeMake(textView.bounds.size.width, FLT_MAX)];
    if (textView.bounds.size.height >= textSize.height) {
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)willEditOverflowView:(UITextView*)textView string:(NSString*)textString range:(NSRange)textRange
{
    // Get the textView frame
    float viewHeight = textView.frame.size.height;
    float width = textView.textContainer.size.width;
    
    NSMutableAttributedString *atrs = [[NSMutableAttributedString alloc] initWithAttributedString: textView.textStorage];
    [atrs replaceCharactersInRange:textRange withString:textString];
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:atrs];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize: CGSizeMake(width, FLT_MAX)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    float textHeight = [layoutManager
                        usedRectForTextContainer:textContainer].size.height;
    
    if (textHeight >= viewHeight - 1) {
        return NO;
    } else
        return YES;
}

+ (NSString*)trimStringToFitRect:(CGRect)rect inset:(CGFloat)inset string:(NSString*)string font:(UIFont*)font
{
    NSString *result = [string copy];
    
    CGSize maxSize = CGSizeMake(rect.size.width  - (inset * 2), FLT_MAX);
    
    CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, } context:nil];
    
    CGSize size = boundingRect.size;
    
    if (rect.size.height < size.height)
        while (rect.size.height < size.height) {
            
            result = [result substringToIndex:result.length - 1];
            
            if (!font) font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
            CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, } context:nil];
            size = boundingRect.size;
        }
    
    return result;
}

@end
