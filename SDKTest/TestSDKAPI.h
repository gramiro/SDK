//
//  TestSDKAPI.h
//  SDKTest
//
//  Created by Ramiro Guerrero on 21/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOAuth2Client.h"

@protocol HandleURLLoginDelegate <NSObject>

-(void)performLoginFromHandle;

@end

@interface TestSDKAPI : AFOAuth2Client

@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, retain) NSArray *scopes;
@property (nonatomic, strong) NSObject <HandleURLLoginDelegate> *loginDelegate;

-(BOOL)handleOpenURL:(NSURL *)url;
+(TestSDKAPI *)sharedClient;
-(void)authorizeWithScopes:(NSArray *)scopes;
-(void)logout;
-(BOOL)isLoginRequired;
-(BOOL)isCredentialExpired;

@end
