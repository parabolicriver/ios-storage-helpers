//
//  PARMusician.m
//  PARStorageHelpers
//
//  Created by Anuj Seth on 4/26/13.
//  Copyright (c) 2013 Parabolic River. All rights reserved.
//

#import "PARMusician.h"

#define kName @"Enter Name"
#define kAbout @"Write Something About Him/Her"

#define kNameKey @"par_musician_name_key"
#define kAboutKey @"par_musician_about_key"

@implementation PARMusician

- (id)init
{
    self = [super init];
    if (self)
    {
        _name = kName;
        _about = kAbout;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_name forKey:kNameKey];
    [encoder encodeObject:_about forKey:kAboutKey];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        _name = [decoder decodeObjectForKey:kNameKey];
        _about = [decoder decodeObjectForKey:kAboutKey];
    }
    
    return self;
}

@end
