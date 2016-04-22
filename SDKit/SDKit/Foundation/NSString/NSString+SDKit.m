//
//  NSString+SDKit.m
//  SDKit
//
//  Created by momo on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "NSString+SDKit.h"

@implementation NSString (SDKit)

/**
 *  判断是否包含中文
 *
 *  @return 是否包含中文
 */
- (BOOL)isContainChinese
{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

/**
 *  判断是否包含空格
 *
 *  @return 是否包含空格
 */
- (BOOL)isContainBlank
{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

/**
 *  判断是否包含特定字符集合
 *
 *  @param set 特定字符集合
 *
 *  @return 是否包含特定字符集合
 */
- (BOOL)isContainCharacterSet:(NSCharacterSet *)set
{
    NSRange rang = [self rangeOfCharacterFromSet:set];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

/**
 *  是否包含字符串
 *
 *  @param string 字符串
 *
 *  @return 是否包含字符串
 */
- (BOOL)isContainString:(NSString *)string
{
    NSRange rang = [self rangeOfString:string];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

/**
 *  判断是否是有效正则字符串
 *
 *  @param regex 正则字符串
 *
 *  @return 是否是有效正则字符串
 */
- (BOOL)isValidateRegex:(NSString *)regex
{
    NSPredicate *curPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL ret = [curPredicate evaluateWithObject:self];
    return ret;
}

/**
 *  判断是否是有效昵称
 *
 *  @return 是否是有效昵称
 */
- (BOOL)isValidateNickname
{
    NSString *curRegex = @"^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    BOOL ret = [self isValidateRegex:curRegex];
    return ret;
}

/**
 *  判断是否是有效电话
 *
 *  @return 是否是有效电话
 */
- (BOOL)isValidateMobile
{
    /**
     *  手机号以13、15、18、170开头，8个 \d 数字字符
     *  小灵通 区号：010,020,021,022,023,024,025,027,028,029 还有未设置的新区号xxx
     */
    NSString *mobileNoRegex = @"^1((3\\d|5[0-35-9]|8[025-9])\\d|70[059])\\d{7}$";
    NSString *phsRegex = @"^0(10|2[0-57-9]|\\d{3})\\d{7,8}$";
    BOOL ret = [self isValidateRegex:mobileNoRegex];
    BOOL ret1 = [self isValidateRegex:phsRegex];
    return (ret || ret1);
}

/**
 *  判断是否是有效IP
 *
 *  @return 是否是有效IP
 */
- (BOOL)isValidateIPAddress
{
    NSString *curRegex = @"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$";
    BOOL ret = [self isValidateRegex:curRegex];
    if (ret) {
        NSArray *componds = [self componentsSeparatedByString:@","];
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        return v;
    }
    return NO;
}

/**
 *  判断是否是有效URL
 *
 *  @return 是否是有效URL
 */
- (BOOL)isValidateURL
{
    NSString *curRegex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    BOOL ret = [self isValidateRegex:curRegex];
    return ret;
}

/**
 *  判断是否是有效Email
 *
 *  @return 是否是有效Email
 */
- (BOOL)isValidateEmail
{
    NSString *curRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    BOOL ret = [self isValidateRegex:curRegex];
    return ret;
}

/**
 *  判断是否是有效IDCard
 *
 *  @return 是否是有效IDCard
 */
- (BOOL)isValidateIDCardNumber
{
    NSString *curRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    BOOL ret = [self isValidateRegex:curRegex];
    return ret;
}

/**
 *  判断是否是有效CarNumber
 *
 *  @return 是否是有效CarNumber
 */
- (BOOL)isValidateCarNumber
{
    // 车牌号:湘K-DE829 香港车牌号码:粤Z-J499港
    NSString *curRegex = @"^[\u4e00-\u9fff]{1}[a-zA-Z]{1}[-][a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fff]$"; // 其中\u4e00-\u9fa5表示unicode编码中汉字已编码部分，\u9fa5-\u9fff是保留部分，将来可能会添加
    BOOL ret = [self isValidateRegex:curRegex];
    return ret;
}

/**
 *  匹配字符串
 *
 *  @param regex 正则表达式
 *
 *  @return 匹配后的字符串
 */
- (NSString *)regex:(NSString *)regex
{
    if (regex.length == 0) return nil;
    NSRange curRange = [self rangeOfString:regex options:NSRegularExpressionSearch];
    if (curRange.location == NSNotFound) return nil;
    NSString *curStr = [self substringWithRange:curRange];
    return curStr;
}

/**
 *  获取字符数量
 *
 *  @return 字符数量
 */
- (NSInteger)wordsCount
{
    NSInteger n = self.length;
    NSInteger i;
    NSInteger l = 0, a = 0, b = 0;
    unichar c;
    for (i = 0; i < n; i++)
    {
        c = [self characterAtIndex:i];
        if (isblank(c)) {
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (NSInteger)ceilf((float)(a + b) / 2.0);
}

@end
