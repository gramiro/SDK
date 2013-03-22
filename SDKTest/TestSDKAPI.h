//
//  TestSDKAPI.h
//  SDKTest
//
//  Created by Ramiro Guerrero on 21/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOAuth2Client.h"

@interface TestSDKAPI : AFOAuth2Client

@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;

-(BOOL)handleOpenURL:(NSURL *)url;
+(TestSDKAPI *)sharedClient;
-(void)initInstagram;

@end
