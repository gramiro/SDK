//
//  SDKServerManager.h
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDKTestAPIClient.h"

@protocol InstagramDelegateProtocol <NSObject>

- (void)updateFollowersArrayWithArray:(NSArray *)array;

@end

@interface SDKServerManager : NSObject
+ (SDKServerManager *)getServerManager;

- (void)getFollowersWithDelegate:(NSObject<InstagramDelegateProtocol> *)delegate;

@end
