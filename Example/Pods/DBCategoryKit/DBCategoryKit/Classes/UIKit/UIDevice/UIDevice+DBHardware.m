//
//  UIDevice+DBHardware.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIDevice+DBHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#import <sys/socket.h>
#import <sys/param.h>
#import <sys/mount.h>
#import <sys/stat.h>
#import <sys/utsname.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <mach/processor_info.h>

@implementation UIDevice (DBHardware)

+ (NSString *)db_platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)db_platformString{
    NSString *platform = [self db_platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max CN";
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([platform isEqualToString:@"iPhone12,8"])   return @"iPhone SE (2nd generation)";
    
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    if ([platform isEqualToString:@"iPod9,1"])      return @"iPod Touch 7G";
    
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (Cellular)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (Cellular)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7-inch (WiFi)";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch (Cellular)";
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch (Cellular)";
    if ([platform isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
    if ([platform isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch (Cellular)";
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
    if ([platform isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";
    if ([platform isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";
    if ([platform isEqualToString:@"iPad8,1"])      return @"iPad Pro 3rd Gen 11-inch (WiFi)";
    if ([platform isEqualToString:@"iPad8,2"])      return @"iPad Pro 3rd Gen 11-inch (WiFi)"; // 1TB
    if ([platform isEqualToString:@"iPad8,3"])      return @"iPad Pro 3rd Gen 11-inch (Cellular)";
    if ([platform isEqualToString:@"iPad8,4"])      return @"iPad Pro 3rd Gen 11-inch (Cellular)"; // 1TB
    if ([platform isEqualToString:@"iPad8,5"])      return @"iPad Pro 3rd Gen 12.9-inch (WiFi)";
    if ([platform isEqualToString:@"iPad8,6"])      return @"iPad Pro 3rd Gen 12.9-inch (WiFi)"; // 1TB
    if ([platform isEqualToString:@"iPad8,7"])      return @"iPad Pro 3rd Gen 12.9-inch (Cellular)";
    if ([platform isEqualToString:@"iPad8,8"])      return @"iPad Pro 3rd Gen 12.9-inch (Cellular)"; // 1TB
    if ([platform isEqualToString:@"iPad8,9"])      return @"iPad Pro 2rd Gen 11-inch";
    if ([platform isEqualToString:@"iPad8,10"])     return @"iPad Pro 2rd Gen 11-inch";
    if ([platform isEqualToString:@"iPad8,11"])     return @"iPad Pro 4rd Gen 12.9-inch";
    if ([platform isEqualToString:@"iPad8,12"])     return @"iPad Pro 4rd Gen 12.9-inch";
    
    if ([platform isEqualToString:@"iPad11,1"])      return @"iPad Mini 5 (WiFi)";
    if ([platform isEqualToString:@"iPad11,2"])      return @"iPad Mini 5";
    if ([platform isEqualToString:@"iPad11,3"])      return @"iPad Air 3 (WiFi)";
    if ([platform isEqualToString:@"iPad11,4"])      return @"iPad Air 3";
    
    if ([platform isEqualToString:@"i386"])         return [UIDevice currentDevice].model;
    if ([platform isEqualToString:@"x86_64"])       return [UIDevice currentDevice].model;
    
    return platform;
}

+ (NSString *)db_macAddress {
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. Rrror!\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)db_systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}
+ (BOOL)db_hasCamera
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
#pragma mark - sysctl utils

+ (NSUInteger)db_getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &result, &size, NULL, 0);
    return (NSUInteger)result;
}

#pragma mark - memory information
+ (NSUInteger)db_cpuFrequency {
    return [self db_getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)db_busFrequency {
    return [self db_getSysInfo:HW_BUS_FREQ];
}

+ (NSUInteger)db_ramSize {
    return [self db_getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)db_cpuNumber {
    return [self db_getSysInfo:HW_NCPU];
}


+ (NSUInteger)db_totalMemoryBytes
{
    return [self db_getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)db_freeMemoryBytes
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        return 0;
    }
    unsigned long mem_free = vm_stat.free_count * pagesize;
    return mem_free;
}

#pragma mark - disk information

+ (long long)db_freeDiskSpaceBytes
{
    struct statfs buf;
    long long freespace;
    freespace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        freespace = (long long)buf.f_bsize * buf.f_bfree;
    }
    return freespace;
}

+ (long long)db_totalDiskSpaceBytes
{
    struct statfs buf;
    long long totalspace;
    totalspace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        totalspace = (long long)buf.f_bsize * buf.f_blocks;
    }
    return totalspace;
}

@end
