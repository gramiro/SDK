//
//  TestSDKAPI.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 21/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "TestSDKAPI.h"
#import "AFOAuth2Client.h"

static TestSDKAPI *testSDK;

@implementation TestSDKAPI
@synthesize clientID = _clientID;
@synthesize params = _params;

+(TestSDKAPI *)getInstance{
    if (!testSDK)
        testSDK = [[TestSDKAPI alloc] init];
    
    return testSDK;
}

-(BOOL)handleOpenURL:(NSURL *)url{
        
        NSString *query = [url fragment];
        if (!query) {
            query = [url query];
        }
        
        self.params = [self parseURLParams:query];
        NSString *accessToken = [self.params valueForKey:@"access_token"];
   
        NSLog(@"ACCESS TOKEN: %@", accessToken);

        // If the URL doesn't contain the access token, an error has occurred.
        if (!accessToken) {
            //        NSString *error = [params valueForKey:@"error"];
            
            //NSString *errorReason = [self.params valueForKey:@"error_reason"];
            
         //   BOOL userDidCancel = [errorReason isEqualToString:@"user_denied"];
       //     [self igDidNotLogin:userDidCancel];
            return YES;
        }
        
        //     [self igDidLogin:accessToken/* expirationDate:expirationDate*/];
        return YES;
    
}

- (NSString *)getOwnBaseUrl {
    return [NSString stringWithFormat:@"ig%@://authorize", self.clientID];
}

- (NSDictionary*)parseURLParams:(NSString *)query {
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString *pair in pairs) {
		NSArray *kv = [pair componentsSeparatedByString:@"="];
		NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
		[params setObject:val forKey:[kv objectAtIndex:0]];
	}
    return params;
}

-(void)initInstagram{
    
    NSURL *url = [NSURL URLWithString:@"https://instagram.com/"];
    
    testSDK = [TestSDKAPI clientWithBaseURL:url clientID:@"b5be30367f2445f5b1824e914d1cb3f5" secret:@"c0fbb6630bbe4c078c77e987c39bed39"];


    [testSDK authenticateUsingOAuthWithPath:@"oauth/authorize/" scope:@"basic" redirectURI:[NSString stringWithFormat:@"ig%@://authorize", @"b5be30367f2445f5b1824e914d1cb3f5"] success:^(AFOAuthCredential *credential) {
        
        
    } failure:^(NSError *error) {
        
        
    }];

}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                                 scope:(NSString *)scope
                           redirectURI:(NSString *)uri
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    // [mutableParameters setObject:kAFOAuthClientCredentialsGrantType forKey:@"grant_type"];
    [mutableParameters setValue:scope forKey:@"scope"];
    [mutableParameters setValue:uri forKey:@"redirect_uri"];
    [mutableParameters setValue:@"token" forKey:@"response_type"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self authenticateUsingOAuthWithPath:path parameters:parameters success:success failure:failure];
}


- (void)authenticateUsingOAuthWithPath:(NSString *)path
                            parameters:(NSDictionary *)parameters
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [mutableParameters setObject:self.clientID forKey:@"client_id"];
    //[mutableParameters setObject:self.secret forKey:@"client_secret"];
    parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self clearAuthorizationHeader];
    
    NSMutableURLRequest *mutableRequest = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    BOOL didOpenOtherApp = NO;
    
    NSLog(@"MutableWeb :%@", mutableRequest.URL);
    
    didOpenOtherApp = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[mutableRequest.URL absoluteString]]];
}


@end
