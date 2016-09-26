//
//  ViewController.m
//  MD5
//
//  Created by warron on 16/9/26.
//  Copyright © 2016年 warron. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * lastStr = [self encryptMd5:@"123"];

    NSLog(@"%@",lastStr);
    
    NSString *lastStrN = [ViewController createMD5:@"123"];
    NSLog(@"%@",lastStrN);
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSMutableString *)encryptMd5:(NSString *)origingString{
    //md5加密
    const char *cStr = [origingString UTF8String];
    unsigned char digest[16];
    
    CC_MD5( cStr,(CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    //加密成md5的字符串
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

+(NSString *)createMD5:(NSString *)signString
{
    const char*cStr =[signString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return[NSString stringWithFormat:
           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
           result[0], result[1], result[2], result[3],
           result[4], result[5], result[6], result[7],
           result[8], result[9], result[10], result[11],
           result[12], result[13], result[14], result[15]
           ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
