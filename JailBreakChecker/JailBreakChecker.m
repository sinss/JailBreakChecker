//
//  JailBreakChecker.m
//  JailBreakChecker
//
//  Created by Leo on 9/28/15.
//  Copyright © 2015 Perfectidea Inc. All rights reserved.
//

#import "JailBreakChecker.h"

@interface JailBreakChecker()

@end

@implementation JailBreakChecker

+ (BOOL)isJailBroken
{
    if ([self isFileExistAtPath:@"/Applications/Cydia.app"] ||
        [self isFileExistAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [self isFileExistAtPath:@"/bin/bash"] ||
        [self isFileExistAtPath:@"/usr/sbin/sshd"] ||
        [self isFileExistAtPath:@"/etc/apt"] ||
        [self isFileExistAtPath:@"/private/var/lib/apt/"] ||
        [self isOpenFile:@"/bin/bash"] ||
        [self isOpenFile:@"/Applications/Cydia.app"] ||
        [self isOpenFile:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [self isOpenFile:@"/usr/sbin/sshd"] ||
        [self isOpenFile:@"/etc/apt"] ||
        [self isWriteToFile:@"/private/jailbreak.txt"])
    {
        return YES;
    }
    return NO;
}

+ (BOOL)isFileExistAtPath:(NSString*)filePath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (BOOL)isOpenFile:(NSString*)filePath
{
    char const *path_cstr = [[NSFileManager defaultManager] fileSystemRepresentationWithPath:filePath];
    FILE *file = fopen(path_cstr, "r");
    if (file == nil)
    {
        return NO;
    }
    fclose(file);
    return YES;
}

+ (BOOL)isWriteToFile:(NSString*)filePath
{
    @try {
        return [@"test" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    @catch (NSException *e) {
        return NO;
    }
}

@end
