//
//  NSString+SDKit.h
//  SDKit
//
//  Created by momo on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SDKit)


/**
*  判断是否包含中文
*
*  @return 是否包含中文
*/
- (BOOL)isContainChinese;

/**
 *  判断是否包含空格
 *
 *  @return 是否包含空格
 */
- (BOOL)isContainBlank;

/**
 *  判断是否包含特定字符集合
 *
 *  @param set 特定字符集合
 *
 *  @return 是否包含特定字符集合
 */
- (BOOL)isContainCharacterSet:(nullable NSCharacterSet *)set;

/**
 *  是否包含字符串
 *
 *  @param string 字符串
 *
 *  @return 是否包含字符串
 */
- (BOOL)isContainString:(nullable NSString *)string;

/**
 *  判断是否是有效正则字符串
 *
 *  @param regex 正则字符串
 *
 *  @return 是否是有效正则字符串
 */
- (BOOL)isValidateRegex:(nullable NSString *)regex;

/**
 *  判断是否是有效昵称
 *
 *  @return 是否是有效昵称
 */
- (BOOL)isValidateNickname;

/**
 *  判断是否是有效电话
 *
 *  @return 是否是有效电话
 */
- (BOOL)isValidateMobile;

/**
 *  判断是否是有效IP
 *
 *  @return 是否是有效IP
 */
- (BOOL)isValidateIPAddress;

/**
 *  判断是否是有效URL
 *
 *  @return 是否是有效URL
 */
- (BOOL)isValidateURL;

/**
 *  判断是否是有效Email
 *
 *  @return 是否是有效Email
 */
- (BOOL)isValidateEmail;

/**
 *  判断是否是有效IDCard
 *
 *  @return 是否是有效IDCard
 */
- (BOOL)isValidateIDCardNumber;

/**
 *  判断是否是有效CarNumber
 *
 *  @return 是否是有效CarNumber
 */
- (BOOL)isValidateCarNumber;

/**
 *  匹配字符串
 *
 *  @param regex 正则表达式
 *
 *  @return 匹配后的字符串
 */
- (nullable NSString *)regex:(nullable NSString *)regex;

/**
 *  获取字符数量
 *
 *  @return 字符数量
 */
- (NSInteger)wordsCount;

@end
