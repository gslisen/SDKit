//
//  NSMutableAttributedString+SDKit.h
//  SDKit
//
//  Created by 陈华荣 on 16/4/19.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableAttributedString (SDKit)
/**
 *
 *   实例化NSMutableAttributedString字符串
 *
 *  @param texts      用于存储所需设置字符串的数组(根据所需自定义类型分组)
 *  @param attrsArray 富文本属性样式的集合(数组元素是texts的相应文本的属性--字典)
 *  @param space      texts文本之间的间距数组 1 代表一个空格的距离
 *
 *  @return NSMutableAttributedString实例
 */

- (instancetype)initWithStrings:(NSArray <NSString *>*)texts attributesArray:(NSArray <NSDictionary<NSString *,id>*>*)attrsArray withSpace:(NSArray <NSNumber *>*)space;

@end
