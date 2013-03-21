//
//  SDKServerManager.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "SDKServerManager.h"

static SDKServerManager *serverManager;

@implementation SDKServerManager

+ (SDKServerManager *)getServerManager{
    
    if (!serverManager)
        serverManager = [[SDKServerManager alloc] init];
    
    return serverManager;
}
@end
