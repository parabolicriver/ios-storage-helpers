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

/* app container helpers */

// returns the default storage path
+ (NSString *)dataFilePath;

// path for file name in the documents folder
+ (NSString *)pathForFileName:(NSString *)fileName;

// data exists at the default storage path or not
+ (BOOL)existsOnDisk;
// data exists at the specified path or not
+ (BOOL)existsOnDiskAtLocation:(NSString *)path;

// write to default path atomically
+ (BOOL)writeToDisk:(id<NSCoding>)userData;
// write to specified path atomically with given key
+ (BOOL)writeToDisk:(id<NSCoding>)userData atLocation:(NSString *)path forKey:(NSString *)key;

// read data from the default path, returns nil when there is no data
+ (id<NSCoding>)readFromDisk;
// read data from specified path, returns nil when there is no data
+ (id<NSCoding>)readFromDiskAtLocation:(NSString *)path forKey:(NSString *)key;

/* app group shared container helpers */

// whether or not the app group was found
+ (BOOL)appGroupContainerExists:(NSString *)groupID;

// path (absolute) for the app group on disk
+ (NSString *)pathForAppGroupContainer:(NSString *)groupID;

// append path (relative) to app group path and return path (absolute)
+ (NSString *)path:(NSString *)path inAppGroupContainer:(NSString *)groupID;

// whether or not this file path (relative) exists inside the app group
+ (BOOL)existsOnDiskAtLocation:(NSString *)path inAppGroupContainer:(NSString *)groupID;

// read and write (atomically) to a path (relative) inside the app group
+ (BOOL)writeToDisk:(id<NSCoding>)userData atLocation:(NSString *)path inAppGroupContainer:(NSString *)groupID forKey:(NSString *)key;
+ (id<NSCoding>)readFromDiskAtLocation:(NSString *)path inAppGroupContainer:(NSString *)groupID forKey:(NSString *)key;

@end
