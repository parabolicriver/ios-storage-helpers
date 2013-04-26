//
//  PARStorageHelpers.m
//  PARStorageHelpers
//
//  Created by Anuj Seth on 4/26/13.
//  Copyright (c) 2013 Parabolic River. All rights reserved.
//

#import "PARStorageHelpers.h"

// default file names
#define kDataFilePath   @"par_user.data"
#define kDataKey        @"par_data_key"

@implementation PARStorageHelpers

+ (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = (NSString *) [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:kDataFilePath];
}

+ (NSString *)pathForFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = (NSString *) [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (BOOL)existsOnDisk
{
    return  [[NSFileManager defaultManager] fileExistsAtPath:[PARStorageHelpers dataFilePath]];
}

+ (BOOL)existsOnDiskAtLocation:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)writeToDisk:(id<NSCoding>)userData
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:userData forKey:kDataKey];
    [archiver finishEncoding];
    
    return [data writeToFile:[PARStorageHelpers dataFilePath] atomically:YES];
}

+ (BOOL)writeToDisk:(id<NSCoding>)userData atLocation:(NSString *)path forKey:(NSString *)key
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:userData forKey:key];
    [archiver finishEncoding];
    
    return [data writeToFile:path atomically:YES];
}

+ (id<NSCoding>)readFromDisk
{
    id<NSCoding> dataFromDisk = nil;
    
    if ([PARStorageHelpers existsOnDisk])
    {
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[PARStorageHelpers dataFilePath]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        dataFromDisk = [unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding];
    }
    
    return dataFromDisk;
}

+ (id<NSCoding>)readFromDiskAtLocation:(NSString *)path forKey:(NSString *)key
{
    id<NSCoding> dataFromDisk = nil;
    
    if ([PARStorageHelpers existsOnDiskAtLocation:path])
    {
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        dataFromDisk = [unarchiver decodeObjectForKey:key];
        [unarchiver finishDecoding];
    }
    
    return dataFromDisk;
}

@end
