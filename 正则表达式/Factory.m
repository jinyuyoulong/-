//
//  Factory.m
//  正则表达式
//
//  Created by fans on 15/11/20.
//  Copyright © 2015年 FF. All rights reserved.
//

#import "Factory.h"

@implementation Factory
#pragma mark - 判断是否是手机号码(合法返回NO)
+ (BOOL)validateMobile:(NSString *)phoneNumber{
    NSString * mobile = @"^1(3[0-9]|5[0-35-9]|8[0-9]|7[0167]|47)\\d{8}$";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [predicate evaluateWithObject:phoneNumber];
}

#pragma mark - 判断字符串的最大长度(正确返回YES)
+ (BOOL)validateStrLength:(NSString *)str andMax:(NSUInteger)max{
    return str.length<=max;
}

#pragma mark - 判断字符串是否合法(合法返回YES)
+ (BOOL)validateStrLegal:(NSString *)str{
    NSString *regex=@"[^%&',;=?$\x22]+";
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

#pragma mark - 判断密码是否合法(合法返回YES)
+ (BOOL)validatePassword:(NSString *)password{
    NSString *regex=@"(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{8,20}";
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:password];
}

#pragma mark - 判断金额是否合法(合法返回YES)
+ (BOOL)validateMoney:(NSString *)money{
    NSString *regex=@"^[0-9]+(.[0-9]{0,2})?$";
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:money];
}
#pragma mark - 验证身份证合法
+ (BOOL)validateIdCard:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}
#pragma mark - PIN
+ (BOOL)validatePINCode:(NSString *)code{
    NSString * reg = @"^(?=.*\\d+)(?!.*?([\\d])\\1{4})[\\d]{5}$";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reg];
    return  [regexTest evaluateWithObject:reg];
}
@end
