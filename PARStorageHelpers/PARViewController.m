//
//  PARViewController.m
//  PARStorageHelpers
//
//  Created by Anuj Seth on 4/26/13.
//  Copyright (c) 2013 Parabolic River. All rights reserved.
//

#import "PARViewController.h"

#import "PARMusician.h"
#import "PARStorageHelpers.h"

@interface PARViewController ()

@end

@implementation PARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PARMusician *eddie = [[PARMusician alloc] init];
    eddie.name = @"Eddie Vedder";
    eddie.about = @"All around awesomeness.";
    
    PARMusician *page = [[PARMusician alloc] init];
    page.name = @"Jimmy Page";
    page.about = @"The look on their faces when he starts whole lotta love hahaha.";
    
    // default path test
    [PARStorageHelpers writeToDisk:eddie];
    PARMusician *eddieBackFromDisk = (PARMusician *) [PARStorageHelpers readFromDisk];
    NSLog(@"%@", eddieBackFromDisk);
    
    // custom path test
    [PARStorageHelpers writeToDisk:page atLocation:[PARStorageHelpers pathForFileName:@"useanyfilenameyouwant"] forKey:@"useakeythatsuniqueinyourcode"];
    PARMusician *pageBackFromDisk = (PARMusician *) [PARStorageHelpers readFromDiskAtLocation:[PARStorageHelpers pathForFileName:@"useanyfilenameyouwant"] forKey:@"useakeythatsuniqueinyourcode"];
    NSLog(@"%@", pageBackFromDisk);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
