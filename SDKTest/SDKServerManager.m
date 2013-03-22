//
//  SDKServerManager.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "SDKServerManager.h"

@interface SDKServerManager ()

@property (nonatomic, strong) NSObject <InstagramDelegateProtocol> *instaDelegate;

@end

static SDKServerManager *serverManager;

@implementation SDKServerManager
@synthesize instaDelegate;

+ (SDKServerManager *)getServerManager{
    
    if (!serverManager)
        serverManager = [[SDKServerManager alloc] init];
    
    return serverManager;
}

- (void)getFollowersWithDelegate:(NSObject<InstagramDelegateProtocol> *)delegate
{
	self.instaDelegate = delegate;
    
	//Do all the stuff
}

@end
