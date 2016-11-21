//
//  Factory.h
//  正则表达式
//
//  Created by fans on 15/11/20.
//  Copyright © 2015年 FF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
//判断是否是手机号码(合法返回YES)
+ (BOOL)validateMobile:(NSString *)mobile;
//判断字符串的最大长度(正确返回YES)
+ (BOOL)validateStrLength:(NSString *)str andMax:(NSUInteger)max;
//判断字符串是否合法(合法返回YES)
+ (BOOL)validateStrLegal:(NSString *)str;
//判断密码是否合法(合法返回YES)
+ (BOOL)validatePassword:(NSString *)password;
//判断金额是否合法(合法返回YES)
+ (BOOL)validateMoney:(NSString *)money;
//判断身份证是否合法(合法返回YES)
+ (BOOL )validateIdCard:(NSString* )idCard;
//PIN
+ (BOOL )validatePINCode:(NSString*)code;

@end
