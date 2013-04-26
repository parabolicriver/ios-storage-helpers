//
//  PARStorageHelpers.h
//  PARStorageHelpers
//
//  Created by Anuj Seth on 4/26/13.
//  Copyright (c) 2013 Parabolic River. All rights reserved.
//

#import <Foundation/Foundation.h>

// Simple storage helpers for NSCoding based
// state serialization to disk.
@interface PARStorageHelpers : NSObject

+ (NSString *)dataFilePath;                                             // returns the default storage path

+ (BOOL)existsOnDisk;                                                   // data exists at the default storage path or not
+ (BOOL)existsOnDisk:(NSString *)path;                                  // data exists at the specified path or not

+ (BOOL)writeToDisk:(id<NSCoding>)data;                                 // write to default path atomically
+ (BOOL)writeToDisk:(id<NSCoding>)data atLocation:(NSString *)path;     // write to specified path atomically

+ (id<NSCoding>)readFromDisk;                                           // read data from the default path, returns nil
                                                                        // when there is no data
+ (id<NSCoding>)readFromDiskAtLocation:(NSString *)path;                // read data from specified path, returns nil when
                                                                        // when there is no data

@end
