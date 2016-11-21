//
//  Factory.h
//  正则表达式
//
//  Created by fans on 15/11/20.
//  Copyright © 2015年 FF. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kReWeiXin @"[A-Za-z0-9_\u4e00-\u9fa5]{1,100}"
#define kRePhoneNumber @"^1(3[0-9]|5[0-35-9]|8[0-9]|7[0167]|47)\\d{8}$"
#define kReString @"[^%&',;=?$\x22]+"
#define kRePassword @"(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{8,20}"
#define kReMoneyFormate @"^[0-9]+(.[0-9]{0,2})?$"
#define kRePIN @"^(?=.*\\d+)(?!.*?([\\d])\\1{4})[\\d]{5}$"

@interface Factory : NSObject
//手机号码(合法返回YES)
+ (BOOL)validateMobile:(NSString *)mobile;
//字符串的最大长度(正确返回YES)
+ (BOOL)validateStrLength:(NSString *)str andMax:(NSUInteger)max;
//字符串(合法返回YES)
+ (BOOL)validateStrLegal:(NSString *)str;
//密码(合法返回YES)
+ (BOOL)validatePassword:(NSString *)password;
//金额是否合法(合法返回YES)
+ (BOOL)validateMoney:(NSString *)money;
//身份证(合法返回YES)
+ (BOOL )validateIdCard:(NSString* )idCard;
//PIN
+ (BOOL )validatePINCode:(NSString*)code;
// wenxin
+ (BOOL)verificationWeiXinContent:(NSString*)content;

@end
