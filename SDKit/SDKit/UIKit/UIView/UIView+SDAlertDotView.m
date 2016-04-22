//
//  UIView+SDAlertDotView.m
//  SDKit
//
//  Created by gsd on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "UIView+SDAlertDotView.h"

#import "UIView+SDViewToolsBasic.h"

@implementation UIView (SDAlertDotView)

#pragma mark -- 基本方法

- (void)sd_showAlertDotWithDotSize:(CGSize)size topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset
{
    UIButton *dot = [self sd_alertDotButton];
    
    if (!dot.superview) {
        [self addSubview:dot];
        dot.backgroundColor = [UIColor redColor];
    }
 
    dot.width = size.width;
    dot.height = size.height;
    dot.left = self.width - dot.width - rightOffset;
    dot.top = topOffset;
    
    if (self.sd_alertDotMaxHeight > 0 && dot.height > self.sd_alertDotMaxHeight) {
        dot.height = self.sd_alertDotMaxHeight;
    }
    
    dot.layer.cornerRadius = dot.height * 0.5;
    dot.clipsToBounds = YES;
    
    
    dot.hidden = NO;
    [self bringSubviewToFront:dot];
}

- (void)sd_showAlertDotWithText:(NSString *)text textFontSize:(CGFloat)fontSize topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset
{
    self.sd_alertDotText = text;
    self.sd_alertDotButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [self sd_showAlertDotWithDotSize:[self sizeWithText:text fontSize:fontSize] topOffset:topOffset rightOffset:rightOffset];
}

- (void)sd_hideAlertDot
{
    UIView *view = [self sd_alertDotButton];
    view.hidden = YES;
}

- (BOOL)sd_isShowingAlertDot
{
    return self.sd_alertDotButton.superview != nil;
}

#pragma mark -- 扩展方法

- (UIButton *)sd_alertDotButton
{
    return self.sd_categoryPropertiesManager.alertDotButton;
}

- (UIColor *)sd_alertDotColor
{
    return [self sd_alertDotButton].backgroundColor;
}

- (void)setSd_alertDotColor:(UIColor *)sd_alertDotColor
{
    [[self sd_alertDotButton] setBackgroundColor:sd_alertDotColor];
}

- (NSString *)sd_alertDotText
{
    return self.sd_alertDotButton.currentTitle;
}

- (void)setSd_alertDotText:(NSString *)sd_alertDotText
{
    [self.sd_alertDotButton setTitle:sd_alertDotText forState:UIControlStateNormal];
}


- (UIColor *)sd_alertDotTextColor
{
    return self.sd_alertDotButton.titleLabel.textColor;
}

- (void)setSd_alertDotTextColor:(UIColor *)sd_alertDotTextColor
{
    [self.sd_alertDotButton setTitleColor:sd_alertDotTextColor forState:UIControlStateNormal];
}

- (CGSize)sizeWithText:(NSString *)text fontSize:(CGFloat)fontSize
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.sd_alertDotButton.titleLabel.font.lineHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.sd_alertDotButton.titleLabel.font} context:nil];
    CGSize size = rect.size;
    size.width += fontSize * 0.6;
    CGFloat wh = MAX(size.height, size.width);
    if (wh < 8) {
        wh = 8;
    }
    size.height = wh;
    size.width = wh;
    return size;
}

- (void)setSd_alertDotMaxHeight:(CGFloat)sd_alertDotMaxHeight
{
    self.sd_categoryPropertiesManager.sd_alertDotMaxHeight = sd_alertDotMaxHeight;
}

- (CGFloat)sd_alertDotMaxHeight
{
    return self.sd_categoryPropertiesManager.sd_alertDotMaxHeight;
}

@end
