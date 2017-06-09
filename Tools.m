//
//  Tools.m
//  DoorLock
//
//  Created by zhenglin1988 on 16/10/10.
//  Copyright © 2016年 郑麟. All rights reserved.
//

#import "Tools.h"

@implementation Tools
// 手机号码校验
+ (BOOL)checkTel:(NSString *)str
{
    if ([str length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"data_null_prompt", nil) message:NSLocalizedString(@"tel_no_null", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        return NO;
    }
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"Please enter a valid mobile phone number", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    return YES;
}

// 手机号码校验
+ (BOOL)isTelNumber:(NSString*) telNumber

{
    
    NSString*pattern =@"^1+[3578]+\\d{9}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    
    return isMatch;
    
}


//是否为6到16位位包含数字和数字密码
+(BOOL)isPassWord:(NSString *)passWord
{
    NSString  *regex = @"(^[A-Za-z0-9]{6,16}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:passWord];
}

+ (UILabel *)textLabel:(NSString *)labelStr
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = labelStr;
    label.textColor = UIColorFromRGB(0x3f9ff7);
    label.font = kFont(17);
    
    return label;
}

//验证添加设备的ID
+(BOOL)distinguishDeviceAndManToolWithLanYaName:(NSString *)username
{
    NSString *regex=@"(^[s|S]\\d{8}[y|Y]\\w{13}$)";//s00145092y00130588ui7mz
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];//accf23cf487a
    BOOL isMatch= [pred evaluateWithObject:username];//@"123456ABCde"
    return isMatch;
}

//验证"产品"添加设备的ID
+(BOOL)distinguishDeviceAndManToolWithProduct:(NSString *)username
{
    NSString *regex=@"(^[a|A]\\w{5}$[c|C]\\w{5}$)";//^[s|S]\\d{8}[y|Y]\\w{13}$
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch= [pred evaluateWithObject:username];//@"123456ABCde"
    return isMatch;
}


//wifi通讯协议 加密运算
+ (NSMutableString *)wifiCommunicationChark1:(unsigned char)kone char2:(unsigned char)ktwo andString:(NSString *)string
{
    char KeyTable[1024]=
    {
        0x00, 0x00, 0x00, 0x00,   0x04, 0xc1, 0x1d, 0xb7,   0x09, 0x82, 0x3b, 0x6e,   0x0d, 0x43, 0x26, 0xd9, //1
        0x13, 0x04, 0x76, 0xdc,   0x17, 0xc5, 0x6b, 0x6b,   0x1a, 0x86, 0x4d, 0xb2,   0x1e, 0x47, 0x50, 0x05, //2
        0x26, 0x08, 0xed, 0xb8,   0x22, 0xc9, 0xf0, 0x0f,   0x2f, 0x8a, 0xd6, 0xd6,   0x2b, 0x4b, 0xcb, 0x61, //3
        0x35, 0x0c, 0x9b, 0x64,   0x31, 0xcd, 0x86, 0xd3,   0x3c, 0x8e, 0xa0, 0x0a,   0x38, 0x4f, 0xbd, 0xbd, //4
        0x4c, 0x11, 0xdb, 0x70,   0x48, 0xd0, 0xc6, 0xc7,   0x45, 0x93, 0xe0, 0x1e,   0x41, 0x52, 0xfd, 0xa9, //5
        0x5f, 0x15, 0xad, 0xac,   0x5b, 0xd4, 0xb0, 0x1b,   0x56, 0x97, 0x96, 0xc2,   0x52, 0x56, 0x8b, 0x75, //6
        0x6a, 0x19, 0x36, 0xc8,   0x6e, 0xd8, 0x2b, 0x7f,   0x63, 0x9b, 0x0d, 0xa6,   0x67, 0x5a, 0x10, 0x11, //7
        0x79, 0x1d, 0x40, 0x14,   0x7d, 0xdc, 0x5d, 0xa3,   0x70, 0x9f, 0x7b, 0x7a,   0x74, 0x5e, 0x66, 0xcd, //8
        0x98, 0x23, 0xb6, 0xe0,   0x9c, 0xe2, 0xab, 0x57,   0x91, 0xa1, 0x8d, 0x8e,   0x95, 0x60, 0x90, 0x39, //9
        0x8b, 0x27, 0xc0, 0x3c,   0x8f, 0xe6, 0xdd, 0x8b,   0x82, 0xa5, 0xfb, 0x52,   0x86, 0x64, 0xe6, 0xe5, //10
        0xbe, 0x2b, 0x5b, 0x58,   0xba, 0xea, 0x46, 0xef,   0xb7, 0xa9, 0x60, 0x36,   0xb3, 0x68, 0x7d, 0x81, //11
        0xad, 0x2f, 0x2d, 0x84,   0xa9, 0xee, 0x30, 0x33,   0xa4, 0xad, 0x16, 0xea,   0xa0, 0x6c, 0x0b, 0x5d, //12
        0xd4, 0x32, 0x6d, 0x90,   0xd0, 0xf3, 0x70, 0x27,   0xdd, 0xb0, 0x56, 0xfe,   0xd9, 0x71, 0x4b, 0x49, //13
        0xc7, 0x36, 0x1b, 0x4c,   0xc3, 0xf7, 0x06, 0xfb,   0xce, 0xb4, 0x20, 0x22,   0xca, 0x75, 0x3d, 0x95, //14
        0xf2, 0x3a, 0x80, 0x28,   0xf6, 0xfb, 0x9d, 0x9f,   0xfb, 0xb8, 0xbb, 0x46,   0xff, 0x79, 0xa6, 0xf1, //15
        0xe1, 0x3e, 0xf6, 0xf4,   0xe5, 0xff, 0xeb, 0x43,   0xe8, 0xbc, 0xcd, 0x9a,   0xec, 0x7d, 0xd0, 0x2d, //16
        0x34, 0x86, 0x70, 0x77,   0x30, 0x47, 0x6d, 0xc0,   0x3d, 0x04, 0x4b, 0x19,   0x39, 0xc5, 0x56, 0xae, //17
        0x27, 0x82, 0x06, 0xab,   0x23, 0x43, 0x1b, 0x1c,   0x2e, 0x00, 0x3d, 0xc5,   0x2a, 0xc1, 0x20, 0x72, //18
        0x12, 0x8e, 0x9d, 0xcf,   0x16, 0x4f, 0x80, 0x78,   0x1b, 0x0c, 0xa6, 0xa1,   0x1f, 0xcd, 0xbb, 0x16, //19
        0x01, 0x8a, 0xeb, 0x13,   0x05, 0x4b, 0xf6, 0xa4,   0x08, 0x08, 0xd0, 0x7d,   0x0c, 0xc9, 0xcd, 0xca, //20
        0x78, 0x97, 0xab, 0x07,   0x7c, 0x56, 0xb6, 0xb0,   0x71, 0x15, 0x90, 0x69,   0x75, 0xd4, 0x8d, 0xde, //21
        0x6b, 0x93, 0xdd, 0xdb,   0x6f, 0x52, 0xc0, 0x6c,   0x62, 0x11, 0xe6, 0xb5,   0x66, 0xd0, 0xfb, 0x02, //22
        0x5e, 0x9f, 0x46, 0xbf,   0x5a, 0x5e, 0x5b, 0x08,   0x57, 0x1d, 0x7d, 0xd1,   0x53, 0xdc, 0x60, 0x66, //23
        0x4d, 0x9b, 0x30, 0x63,   0x49, 0x5a, 0x2d, 0xd4,   0x44, 0x19, 0x0b, 0x0d,   0x40, 0xd8, 0x16, 0xba, //24
        0xac, 0xa5, 0xc6, 0x97,   0xa8, 0x64, 0xdb, 0x20,   0xa5, 0x27, 0xfd, 0xf9,   0xa1, 0xe6, 0xe0, 0x4e, //25
        0xbf, 0xa1, 0xb0, 0x4b,   0xbb, 0x60, 0xad, 0xfc,   0xb6, 0x23, 0x8b, 0x25,   0xb2, 0xe2, 0x96, 0x92, //26
        0x8a, 0xad, 0x2b, 0x2f,   0x8e, 0x6c, 0x36, 0x98,   0x83, 0x2f, 0x10, 0x41,   0x87, 0xee, 0x0d, 0xf6, //27
        0x99, 0xa9, 0x5d, 0xf3,   0x9d, 0x68, 0x40, 0x44,   0x90, 0x2b, 0x66, 0x9d,   0x94, 0xea, 0x7b, 0x2a, //28
        0xe0, 0xb4, 0x1d, 0xe7,   0xe4, 0x75, 0x00, 0x50,   0xe9, 0x36, 0x26, 0x89,   0xed, 0xf7, 0x3b, 0x3e, //29
        0xf3, 0xb0, 0x6b, 0x3b,   0xf7, 0x71, 0x76, 0x8c,   0xfa, 0x32, 0x50, 0x55,   0xfe, 0xf3, 0x4d, 0xe2, //30
        0xc6, 0xbc, 0xf0, 0x5f,   0xc2, 0x7d, 0xed, 0xe8,   0xcf, 0x3e, 0xcb, 0x31,   0xcb, 0xff, 0xd6, 0x86, //31
        0xd5, 0xb8, 0x86, 0x83,   0xd1, 0x79, 0x9b, 0x34,   0xdc, 0x3a, 0xbd, 0xed,   0xd8, 0xfb, 0xa0, 0x5a, //32
        0x69, 0x0c, 0xe0, 0xee,   0x6d, 0xcd, 0xfd, 0x59,   0x60, 0x8e, 0xdb, 0x80,   0x64, 0x4f, 0xc6, 0x37, //33
        0x7a, 0x08, 0x96, 0x32,   0x7e, 0xc9, 0x8b, 0x85,   0x73, 0x8a, 0xad, 0x5c,   0x77, 0x4b, 0xb0, 0xeb, //34
        0x4f, 0x04, 0x0d, 0x56,   0x4b, 0xc5, 0x10, 0xe1,   0x46, 0x86, 0x36, 0x38,   0x42, 0x47, 0x2b, 0x8f, //35
        0x5c, 0x00, 0x7b, 0x8a,   0x58, 0xc1, 0x66, 0x3d,   0x55, 0x82, 0x40, 0xe4,   0x51, 0x43, 0x5d, 0x53, //36
        0x25, 0x1d, 0x3b, 0x9e,   0x21, 0xdc, 0x26, 0x29,   0x2c, 0x9f, 0x00, 0xf0,   0x28, 0x5e, 0x1d, 0x47, //37
        0x36, 0x19, 0x4d, 0x42,   0x32, 0xd8, 0x50, 0xf5,   0x3f, 0x9b, 0x76, 0x2c,   0x3b, 0x5a, 0x6b, 0x9b, //38
        0x03, 0x15, 0xd6, 0x26,   0x07, 0xd4, 0xcb, 0x91,   0x0a, 0x97, 0xed, 0x48,   0x0e, 0x56, 0xf0, 0xff, //39
        0x10, 0x11, 0xa0, 0xfa,   0x14, 0xd0, 0xbd, 0x4d,   0x19, 0x93, 0x9b, 0x94,   0x1d, 0x52, 0x86, 0x23, //40
        0xf1, 0x2f, 0x56, 0x0e,   0xf5, 0xee, 0x4b, 0xb9,   0xf8, 0xad, 0x6d, 0x60,   0xfc, 0x6c, 0x70, 0xd7, //41
        0xe2, 0x2b, 0x20, 0xd2,   0xe6, 0xea, 0x3d, 0x65,   0xeb, 0xa9, 0x1b, 0xbc,   0xef, 0x68, 0x06, 0x0b, //42
        0xd7, 0x27, 0xbb, 0xb6,   0xd3, 0xe6, 0xa6, 0x01,   0xde, 0xa5, 0x80, 0xd8,   0xda, 0x64, 0x9d, 0x6f, //43
        0xc4, 0x23, 0xcd, 0x6a,   0xc0, 0xe2, 0xd0, 0xdd,   0xcd, 0xa1, 0xf6, 0x04,   0xc9, 0x60, 0xeb, 0xb3, //44
        0xbd, 0x3e, 0x8d, 0x7e,   0xb9, 0xff, 0x90, 0xc9,   0xb4, 0xbc, 0xb6, 0x10,   0xb0, 0x7d, 0xab, 0xa7, //45
        0xae, 0x3a, 0xfb, 0xa2,   0xaa, 0xfb, 0xe6, 0x15,   0xa7, 0xb8, 0xc0, 0xcc,   0xa3, 0x79, 0xdd, 0x7b, //46
        0x9b, 0x36, 0x60, 0xc6,   0x9f, 0xf7, 0x7d, 0x71,   0x92, 0xb4, 0x5b, 0xa8,   0x96, 0x75, 0x46, 0x1f, //47
        0x88, 0x32, 0x16, 0x1a,   0x8c, 0xf3, 0x0b, 0xad,   0x81, 0xb0, 0x2d, 0x74,   0x85, 0x71, 0x30, 0xc3, //48
        0x5d, 0x8a, 0x90, 0x99,   0x59, 0x4b, 0x8d, 0x2e,   0x54, 0x08, 0xab, 0xf7,   0x50, 0xc9, 0xb6, 0x40, //49
        0x4e, 0x8e, 0xe6, 0x45,   0x4a, 0x4f, 0xfb, 0xf2,   0x47, 0x0c, 0xdd, 0x2b,   0x43, 0xcd, 0xc0, 0x9c, //50
        0x7b, 0x82, 0x7d, 0x21,   0x7f, 0x43, 0x60, 0x96,   0x72, 0x00, 0x46, 0x4f,   0x76, 0xc1, 0x5b, 0xf8, //51
        0x68, 0x86, 0x0b, 0xfd,   0x6c, 0x47, 0x16, 0x4a,   0x61, 0x04, 0x30, 0x93,   0x65, 0xc5, 0x2d, 0x24, //52
        0x11, 0x9b, 0x4b, 0xe9,   0x15, 0x5a, 0x56, 0x5e,   0x18, 0x19, 0x70, 0x87,   0x1c, 0xd8, 0x6d, 0x30, //53
        0x02, 0x9f, 0x3d, 0x35,   0x06, 0x5e, 0x20, 0x82,   0x0b, 0x1d, 0x06, 0x5b,   0x0f, 0xdc, 0x1b, 0xec, //54
        0x37, 0x93, 0xa6, 0x51,   0x33, 0x52, 0xbb, 0xe6,   0x3e, 0x11, 0x9d, 0x3f,   0x3a, 0xd0, 0x80, 0x88, //55
        0x24, 0x97, 0xd0, 0x8d,   0x20, 0x56, 0xcd, 0x3a,   0x2d, 0x15, 0xeb, 0xe3,   0x29, 0xd4, 0xf6, 0x54, //56
        0xc5, 0xa9, 0x26, 0x79,   0xc1, 0x68, 0x3b, 0xce,   0xcc, 0x2b, 0x1d, 0x17,   0xc8, 0xea, 0x00, 0xa0, //57
        0xd6, 0xad, 0x50, 0xa5,   0xd2, 0x6c, 0x4d, 0x12,   0xdf, 0x2f, 0x6b, 0xcb,   0xdb, 0xee, 0x76, 0x7c, //58
        0xe3, 0xa1, 0xcb, 0xc1,   0xe7, 0x60, 0xd6, 0x76,   0xea, 0x23, 0xf0, 0xaf,   0xee, 0xe2, 0xed, 0x18, //59
        0xf0, 0xa5, 0xbd, 0x1d,   0xf4, 0x64, 0xa0, 0xaa,   0xf9, 0x27, 0x86, 0x73,   0xfd, 0xe6, 0x9b, 0xc4, //60
        0x89, 0xb8, 0xfd, 0x09,   0x8d, 0x79, 0xe0, 0xbe,   0x80, 0x3a, 0xc6, 0x67,   0x84, 0xfb, 0xdb, 0xd0, //61
        0x9a, 0xbc, 0x8b, 0xd5,   0x9e, 0x7d, 0x96, 0x62,   0x93, 0x3e, 0xb0, 0xbb,   0x97, 0xff, 0xad, 0x0c, //62
        0xaf, 0xb0, 0x10, 0xb1,   0xab, 0x71, 0x0d, 0x06,   0xa6, 0x32, 0x2b, 0xdf,   0xa2, 0xf3, 0x36, 0x68, //63
        0xbc, 0xb4, 0x66, 0x6d,   0xb8, 0x75, 0x7b, 0xda,   0xb5, 0x36, 0x5d, 0x03,   0xb1, 0xf7, 0x40, 0xb4  //64
    };
    unsigned char k1 = kone;
    unsigned char k2 = ktwo;
   
    NSInteger lengh = string.length;
    NSMutableString *mutStr = [[NSMutableString alloc] init];
    unsigned int L;
    unsigned char M,i;
    unsigned int N[20];
    
    L=(k2<<8)+k1;
    M=(char)(L/1024); //获取秘钥间隔
    N[0]=(L%1024); //获取秘钥下标
    Byte YHByte;
    
//    NSLog(@"L==%d M==%d N[0]==%d",L,M,N[0]);
    
    
    for(i=0;i<lengh;i++)
    {
        N[i]=(N[0]+(M+1)*i)%1024;
        
        YHByte = KeyTable[N[i]]^(strtoul([[string substringWithRange:NSMakeRange(i, 1)]UTF8String], 0, 16)); //加密，根据加密方式不同，取不同的开头秘钥和秘钥间距的秘钥与密码进行异或运算得到密文
        NSString * lASTS = [NSString stringWithFormat:@"%02X",YHByte];
        
        [mutStr appendString:lASTS];
        
    }
    
    return mutStr;
    
}

//解密运算
+ (NSMutableString *)jieMiChark1:(unsigned char)kone char2:(unsigned char)ktwo andString:(NSString *)string
{
    
    char KeyTable[1024]=
    {
        0x00, 0x00, 0x00, 0x00,   0x04, 0xc1, 0x1d, 0xb7,   0x09, 0x82, 0x3b, 0x6e,   0x0d, 0x43, 0x26, 0xd9, //1
        0x13, 0x04, 0x76, 0xdc,   0x17, 0xc5, 0x6b, 0x6b,   0x1a, 0x86, 0x4d, 0xb2,   0x1e, 0x47, 0x50, 0x05, //2
        0x26, 0x08, 0xed, 0xb8,   0x22, 0xc9, 0xf0, 0x0f,   0x2f, 0x8a, 0xd6, 0xd6,   0x2b, 0x4b, 0xcb, 0x61, //3
        0x35, 0x0c, 0x9b, 0x64,   0x31, 0xcd, 0x86, 0xd3,   0x3c, 0x8e, 0xa0, 0x0a,   0x38, 0x4f, 0xbd, 0xbd, //4
        0x4c, 0x11, 0xdb, 0x70,   0x48, 0xd0, 0xc6, 0xc7,   0x45, 0x93, 0xe0, 0x1e,   0x41, 0x52, 0xfd, 0xa9, //5
        0x5f, 0x15, 0xad, 0xac,   0x5b, 0xd4, 0xb0, 0x1b,   0x56, 0x97, 0x96, 0xc2,   0x52, 0x56, 0x8b, 0x75, //6
        0x6a, 0x19, 0x36, 0xc8,   0x6e, 0xd8, 0x2b, 0x7f,   0x63, 0x9b, 0x0d, 0xa6,   0x67, 0x5a, 0x10, 0x11, //7
        0x79, 0x1d, 0x40, 0x14,   0x7d, 0xdc, 0x5d, 0xa3,   0x70, 0x9f, 0x7b, 0x7a,   0x74, 0x5e, 0x66, 0xcd, //8
        0x98, 0x23, 0xb6, 0xe0,   0x9c, 0xe2, 0xab, 0x57,   0x91, 0xa1, 0x8d, 0x8e,   0x95, 0x60, 0x90, 0x39, //9
        0x8b, 0x27, 0xc0, 0x3c,   0x8f, 0xe6, 0xdd, 0x8b,   0x82, 0xa5, 0xfb, 0x52,   0x86, 0x64, 0xe6, 0xe5, //10
        0xbe, 0x2b, 0x5b, 0x58,   0xba, 0xea, 0x46, 0xef,   0xb7, 0xa9, 0x60, 0x36,   0xb3, 0x68, 0x7d, 0x81, //11
        0xad, 0x2f, 0x2d, 0x84,   0xa9, 0xee, 0x30, 0x33,   0xa4, 0xad, 0x16, 0xea,   0xa0, 0x6c, 0x0b, 0x5d, //12
        0xd4, 0x32, 0x6d, 0x90,   0xd0, 0xf3, 0x70, 0x27,   0xdd, 0xb0, 0x56, 0xfe,   0xd9, 0x71, 0x4b, 0x49, //13
        0xc7, 0x36, 0x1b, 0x4c,   0xc3, 0xf7, 0x06, 0xfb,   0xce, 0xb4, 0x20, 0x22,   0xca, 0x75, 0x3d, 0x95, //14
        0xf2, 0x3a, 0x80, 0x28,   0xf6, 0xfb, 0x9d, 0x9f,   0xfb, 0xb8, 0xbb, 0x46,   0xff, 0x79, 0xa6, 0xf1, //15
        0xe1, 0x3e, 0xf6, 0xf4,   0xe5, 0xff, 0xeb, 0x43,   0xe8, 0xbc, 0xcd, 0x9a,   0xec, 0x7d, 0xd0, 0x2d, //16
        0x34, 0x86, 0x70, 0x77,   0x30, 0x47, 0x6d, 0xc0,   0x3d, 0x04, 0x4b, 0x19,   0x39, 0xc5, 0x56, 0xae, //17
        0x27, 0x82, 0x06, 0xab,   0x23, 0x43, 0x1b, 0x1c,   0x2e, 0x00, 0x3d, 0xc5,   0x2a, 0xc1, 0x20, 0x72, //18
        0x12, 0x8e, 0x9d, 0xcf,   0x16, 0x4f, 0x80, 0x78,   0x1b, 0x0c, 0xa6, 0xa1,   0x1f, 0xcd, 0xbb, 0x16, //19
        0x01, 0x8a, 0xeb, 0x13,   0x05, 0x4b, 0xf6, 0xa4,   0x08, 0x08, 0xd0, 0x7d,   0x0c, 0xc9, 0xcd, 0xca, //20
        0x78, 0x97, 0xab, 0x07,   0x7c, 0x56, 0xb6, 0xb0,   0x71, 0x15, 0x90, 0x69,   0x75, 0xd4, 0x8d, 0xde, //21
        0x6b, 0x93, 0xdd, 0xdb,   0x6f, 0x52, 0xc0, 0x6c,   0x62, 0x11, 0xe6, 0xb5,   0x66, 0xd0, 0xfb, 0x02, //22
        0x5e, 0x9f, 0x46, 0xbf,   0x5a, 0x5e, 0x5b, 0x08,   0x57, 0x1d, 0x7d, 0xd1,   0x53, 0xdc, 0x60, 0x66, //23
        0x4d, 0x9b, 0x30, 0x63,   0x49, 0x5a, 0x2d, 0xd4,   0x44, 0x19, 0x0b, 0x0d,   0x40, 0xd8, 0x16, 0xba, //24
        0xac, 0xa5, 0xc6, 0x97,   0xa8, 0x64, 0xdb, 0x20,   0xa5, 0x27, 0xfd, 0xf9,   0xa1, 0xe6, 0xe0, 0x4e, //25
        0xbf, 0xa1, 0xb0, 0x4b,   0xbb, 0x60, 0xad, 0xfc,   0xb6, 0x23, 0x8b, 0x25,   0xb2, 0xe2, 0x96, 0x92, //26
        0x8a, 0xad, 0x2b, 0x2f,   0x8e, 0x6c, 0x36, 0x98,   0x83, 0x2f, 0x10, 0x41,   0x87, 0xee, 0x0d, 0xf6, //27
        0x99, 0xa9, 0x5d, 0xf3,   0x9d, 0x68, 0x40, 0x44,   0x90, 0x2b, 0x66, 0x9d,   0x94, 0xea, 0x7b, 0x2a, //28
        0xe0, 0xb4, 0x1d, 0xe7,   0xe4, 0x75, 0x00, 0x50,   0xe9, 0x36, 0x26, 0x89,   0xed, 0xf7, 0x3b, 0x3e, //29
        0xf3, 0xb0, 0x6b, 0x3b,   0xf7, 0x71, 0x76, 0x8c,   0xfa, 0x32, 0x50, 0x55,   0xfe, 0xf3, 0x4d, 0xe2, //30
        0xc6, 0xbc, 0xf0, 0x5f,   0xc2, 0x7d, 0xed, 0xe8,   0xcf, 0x3e, 0xcb, 0x31,   0xcb, 0xff, 0xd6, 0x86, //31
        0xd5, 0xb8, 0x86, 0x83,   0xd1, 0x79, 0x9b, 0x34,   0xdc, 0x3a, 0xbd, 0xed,   0xd8, 0xfb, 0xa0, 0x5a, //32
        0x69, 0x0c, 0xe0, 0xee,   0x6d, 0xcd, 0xfd, 0x59,   0x60, 0x8e, 0xdb, 0x80,   0x64, 0x4f, 0xc6, 0x37, //33
        0x7a, 0x08, 0x96, 0x32,   0x7e, 0xc9, 0x8b, 0x85,   0x73, 0x8a, 0xad, 0x5c,   0x77, 0x4b, 0xb0, 0xeb, //34
        0x4f, 0x04, 0x0d, 0x56,   0x4b, 0xc5, 0x10, 0xe1,   0x46, 0x86, 0x36, 0x38,   0x42, 0x47, 0x2b, 0x8f, //35
        0x5c, 0x00, 0x7b, 0x8a,   0x58, 0xc1, 0x66, 0x3d,   0x55, 0x82, 0x40, 0xe4,   0x51, 0x43, 0x5d, 0x53, //36
        0x25, 0x1d, 0x3b, 0x9e,   0x21, 0xdc, 0x26, 0x29,   0x2c, 0x9f, 0x00, 0xf0,   0x28, 0x5e, 0x1d, 0x47, //37
        0x36, 0x19, 0x4d, 0x42,   0x32, 0xd8, 0x50, 0xf5,   0x3f, 0x9b, 0x76, 0x2c,   0x3b, 0x5a, 0x6b, 0x9b, //38
        0x03, 0x15, 0xd6, 0x26,   0x07, 0xd4, 0xcb, 0x91,   0x0a, 0x97, 0xed, 0x48,   0x0e, 0x56, 0xf0, 0xff, //39
        0x10, 0x11, 0xa0, 0xfa,   0x14, 0xd0, 0xbd, 0x4d,   0x19, 0x93, 0x9b, 0x94,   0x1d, 0x52, 0x86, 0x23, //40
        0xf1, 0x2f, 0x56, 0x0e,   0xf5, 0xee, 0x4b, 0xb9,   0xf8, 0xad, 0x6d, 0x60,   0xfc, 0x6c, 0x70, 0xd7, //41
        0xe2, 0x2b, 0x20, 0xd2,   0xe6, 0xea, 0x3d, 0x65,   0xeb, 0xa9, 0x1b, 0xbc,   0xef, 0x68, 0x06, 0x0b, //42
        0xd7, 0x27, 0xbb, 0xb6,   0xd3, 0xe6, 0xa6, 0x01,   0xde, 0xa5, 0x80, 0xd8,   0xda, 0x64, 0x9d, 0x6f, //43
        0xc4, 0x23, 0xcd, 0x6a,   0xc0, 0xe2, 0xd0, 0xdd,   0xcd, 0xa1, 0xf6, 0x04,   0xc9, 0x60, 0xeb, 0xb3, //44
        0xbd, 0x3e, 0x8d, 0x7e,   0xb9, 0xff, 0x90, 0xc9,   0xb4, 0xbc, 0xb6, 0x10,   0xb0, 0x7d, 0xab, 0xa7, //45
        0xae, 0x3a, 0xfb, 0xa2,   0xaa, 0xfb, 0xe6, 0x15,   0xa7, 0xb8, 0xc0, 0xcc,   0xa3, 0x79, 0xdd, 0x7b, //46
        0x9b, 0x36, 0x60, 0xc6,   0x9f, 0xf7, 0x7d, 0x71,   0x92, 0xb4, 0x5b, 0xa8,   0x96, 0x75, 0x46, 0x1f, //47
        0x88, 0x32, 0x16, 0x1a,   0x8c, 0xf3, 0x0b, 0xad,   0x81, 0xb0, 0x2d, 0x74,   0x85, 0x71, 0x30, 0xc3, //48
        0x5d, 0x8a, 0x90, 0x99,   0x59, 0x4b, 0x8d, 0x2e,   0x54, 0x08, 0xab, 0xf7,   0x50, 0xc9, 0xb6, 0x40, //49
        0x4e, 0x8e, 0xe6, 0x45,   0x4a, 0x4f, 0xfb, 0xf2,   0x47, 0x0c, 0xdd, 0x2b,   0x43, 0xcd, 0xc0, 0x9c, //50
        0x7b, 0x82, 0x7d, 0x21,   0x7f, 0x43, 0x60, 0x96,   0x72, 0x00, 0x46, 0x4f,   0x76, 0xc1, 0x5b, 0xf8, //51
        0x68, 0x86, 0x0b, 0xfd,   0x6c, 0x47, 0x16, 0x4a,   0x61, 0x04, 0x30, 0x93,   0x65, 0xc5, 0x2d, 0x24, //52
        0x11, 0x9b, 0x4b, 0xe9,   0x15, 0x5a, 0x56, 0x5e,   0x18, 0x19, 0x70, 0x87,   0x1c, 0xd8, 0x6d, 0x30, //53
        0x02, 0x9f, 0x3d, 0x35,   0x06, 0x5e, 0x20, 0x82,   0x0b, 0x1d, 0x06, 0x5b,   0x0f, 0xdc, 0x1b, 0xec, //54
        0x37, 0x93, 0xa6, 0x51,   0x33, 0x52, 0xbb, 0xe6,   0x3e, 0x11, 0x9d, 0x3f,   0x3a, 0xd0, 0x80, 0x88, //55
        0x24, 0x97, 0xd0, 0x8d,   0x20, 0x56, 0xcd, 0x3a,   0x2d, 0x15, 0xeb, 0xe3,   0x29, 0xd4, 0xf6, 0x54, //56
        0xc5, 0xa9, 0x26, 0x79,   0xc1, 0x68, 0x3b, 0xce,   0xcc, 0x2b, 0x1d, 0x17,   0xc8, 0xea, 0x00, 0xa0, //57
        0xd6, 0xad, 0x50, 0xa5,   0xd2, 0x6c, 0x4d, 0x12,   0xdf, 0x2f, 0x6b, 0xcb,   0xdb, 0xee, 0x76, 0x7c, //58
        0xe3, 0xa1, 0xcb, 0xc1,   0xe7, 0x60, 0xd6, 0x76,   0xea, 0x23, 0xf0, 0xaf,   0xee, 0xe2, 0xed, 0x18, //59
        0xf0, 0xa5, 0xbd, 0x1d,   0xf4, 0x64, 0xa0, 0xaa,   0xf9, 0x27, 0x86, 0x73,   0xfd, 0xe6, 0x9b, 0xc4, //60
        0x89, 0xb8, 0xfd, 0x09,   0x8d, 0x79, 0xe0, 0xbe,   0x80, 0x3a, 0xc6, 0x67,   0x84, 0xfb, 0xdb, 0xd0, //61
        0x9a, 0xbc, 0x8b, 0xd5,   0x9e, 0x7d, 0x96, 0x62,   0x93, 0x3e, 0xb0, 0xbb,   0x97, 0xff, 0xad, 0x0c, //62
        0xaf, 0xb0, 0x10, 0xb1,   0xab, 0x71, 0x0d, 0x06,   0xa6, 0x32, 0x2b, 0xdf,   0xa2, 0xf3, 0x36, 0x68, //63
        0xbc, 0xb4, 0x66, 0x6d,   0xb8, 0x75, 0x7b, 0xda,   0xb5, 0x36, 0x5d, 0x03,   0xb1, 0xf7, 0x40, 0xb4  //64
    };
    unsigned char k1 = kone;
    unsigned char k2 = ktwo;
    
    NSInteger lengh = string.length / 2;
    
    NSMutableString *mutStr = [[NSMutableString alloc] init];
    unsigned int L;
    unsigned char M,i;
    unsigned int N[20];
    
    L=(k2<<8)+k1;
    M=(char)(L/1024); //获取秘钥间隔
    N[0]=(L%1024); //获取秘钥下标
    Byte YHByte;
 
    for(i=0;i<lengh;i++)
    {
        N[i]=(N[0]+(M+1)*i)%1024;
        
        YHByte = KeyTable[N[i]]^strtoul([[string substringWithRange:NSMakeRange(i*2, 2)] UTF8String], 0, 16); //加密，根据加密方式不同，取不同的开头秘钥和秘钥间距的秘钥与密码进行异或运算得到密文
        NSString * lASTS = [NSString stringWithFormat:@"%02X",YHByte];//字节转16字符串
        NSString * tenStr = [NSString stringWithFormat:@"%lu",strtoul([lASTS UTF8String],0,16)];//16转10
        [mutStr appendString:tenStr];
        
    }
    
    return mutStr;
}
//获取门锁回应的字符串 得到k1 (byte类型)
+ (Byte)byteOneStr:(NSString *)string
{
    unsigned long lengh = string.length/2;
    Byte infoByte[lengh];
    for (int i=0; i<lengh; i++) {
        infoByte[i] = strtoul([[string substringWithRange:NSMakeRange(i*2, 2)] UTF8String], 0, 16); //16进制
    }
    NSData *newData = [NSData dataWithBytes:infoByte length:lengh];
    Byte *returnByte = (Byte *)[newData bytes];
    Byte byteOne = returnByte[lengh-3];
    return byteOne;
}

//获取门锁回应的字符串 得到k2 (byte类型)
+ (Byte)byteTwoStr:(NSString *)string
{
    unsigned long lengh = string.length/2;
    Byte infoByte[lengh];
    for (int i=0; i<lengh; i++) {
        infoByte[i] = strtoul([[string substringWithRange:NSMakeRange(i*2, 2)] UTF8String], 0, 16); //16进制
    }
    NSData *newData = [NSData dataWithBytes:infoByte length:lengh];
    Byte *returnByte = (Byte *)[newData bytes];
    Byte byteTwo = returnByte[lengh-2];
    return byteTwo;
}

//传入命令格式string和加密string  返回异或string
+ (NSString *)stylestring:(NSMutableString *)styleStr
{
    unsigned long styleLengh = styleStr.length/2;
    
    Byte styleByte[styleLengh];
    
    
    for (int i =0; i<styleLengh; i++)
    {
        styleByte[i] = strtoul([[styleStr substringWithRange:NSMakeRange(i*2, 2)]UTF8String], 0, 16);
    }
    NSData *styleData = [NSData dataWithBytes:styleByte length:styleLengh];
    Byte * returnStyleBT = (Byte *)[styleData bytes];
    Byte styleTemp = returnStyleBT[0];//用于保存异或结果
    
    for (int j=1; j<styleLengh; j++)
    {
        styleTemp ^= returnStyleBT[j];
    }
    
    NSString * lastStr = [NSString stringWithFormat:@"%0X",styleTemp];
    
    return lastStr;
}

//data转换为十六进制的string
+ (NSString *)hexStringFromData:(NSData *)myD
{
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    
    return hexStr;
}

//字符串截取  响应结果
+ (NSString *)resultString:(NSString *)string
{
    NSInteger num = string.length;
    NSString * resultStr = [string substringWithRange:NSMakeRange(num-4, 2)];
    return resultStr;
}

//十进制数转16进制字符串
+ (NSString *)tenInt:(NSInteger)integer
{
    NSString * sixteenStr = [NSString stringWithFormat:@"%@",[[NSString alloc] initWithFormat:@"%02lx",(long)integer]];
    
    return sixteenStr;
}


//传入命令格式string 返回data 发送给蓝牙
+ (NSData *)mutString:(NSMutableString *)dataStr
{
    unsigned long styleLengh = dataStr.length/2;
    
    Byte styleByte[styleLengh];
    
    
    for (int i =0; i<styleLengh; i++)
    {
        styleByte[i] = strtoul([[dataStr substringWithRange:NSMakeRange(i*2, 2)]UTF8String], 0, 16);
    }
    NSData *styleData = [NSData dataWithBytes:styleByte length:styleLengh];
    
    return styleData;
}

+ (NSMutableString *)sixteenString:(NSString *)YCXsecrect
{
    NSMutableString * mutS = [[NSMutableString alloc] init];
    
    NSInteger len = YCXsecrect.length;
    Byte styByte[len];
    for (NSInteger i = 0; i<len; i++) {
        styByte[i] = strtoul([[YCXsecrect substringWithRange:NSMakeRange(i, 1)]UTF8String], 0, 16);
        NSString * string = [NSString stringWithFormat:@"%02X",styByte[i]];
        [mutS appendString:string];
    }
    

    return mutS;
}
//http返回的是字典形式的字符串 转出message 字符串
+ (NSString *)messageStr:(NSString *)JsonString
{
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    NSString * cmdStr = dic[@"message"];//消息,字典中还有mac和手机号.
    
    
    return cmdStr;
}
//http返回的是字典形式的字符串 转出MAC 字符串
+ (NSString *)macStr:(NSString *)JsonString
{
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    NSString * macStr = dic[@"mac"];//消息,字典中还有mac和手机号.
    
    
    return macStr;
}
//http返回的是字典形式的字符串 转出name 字符串
+ (NSString *)nameStr:(NSString *)JsonString
{
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    NSString * nameStr = dic[@"name"];//消息,字典中还有mac和手机号.
    
    
    return nameStr;
}
+(id)changeType:(id)myObj
{
    
   if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    return myObj;
    
}


//将Null类型的项目转化成@""
+(NSString *)nullToString
{
    return @"";
}
//将NSDictionary中的Null类型的项目转化成@""
+(NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (NSInteger i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

#pragma mark - 解析MAC地址
+(NSString *)changeUtfEncodeToNsstringWithStr:(NSString *)str
{
    //<20c38fc0 8a54>
    //A。取消两边的符号
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSString *newTwolStr = [newStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    NSString *valibelStr = [newTwolStr  stringByReplacingOccurrencesOfString:@" " withString:@""];//去掉空格
    
    //B.将字符两位一截取，转化为16进制的数
    NSString *macStr = [[NSString alloc]init];
    for (int k = (int)valibelStr.length-2; k >= 4; k-=2)
    {
        NSString *intStr = [valibelStr substringWithRange:NSMakeRange(k, 2)];
        macStr = [NSString stringWithFormat:@"%@%@",macStr,intStr];
    }
    return [macStr uppercaseString];//转换成大写
}

@end
