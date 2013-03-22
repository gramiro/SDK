//
//  TestSDKAPI.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 21/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "TestSDKAPI.h"
#import "AFOAuth2Client.h"

static NSString * const kOAuth2BaseURLString = @"https://instagram.com/";
static NSString * const kClientIDString = @"b5be30367f2445f5b1824e914d1cb3f5";
static NSString * const kClientSecretString = @"c0fbb6630bbe4c078c77e987c39bed39";

static TestSDKAPI * testSDK;

@implementation TestSDKAPI
@synthesize clientID = _clientID;
@synthesize params = _params;
@synthesize credential = _credential;

+ (TestSDKAPI *)sharedClient {
    static TestSDKAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc]init];
    });
    
    return _sharedClient;
}


-(BOOL)handleOpenURL:(NSURL *)url{
        
        NSString *query = [url fragment];
        if (!query) {
            query = [url query];
        }
        
        self.params = [self parseURLParams:query];
        NSString *accessToken = [self.params valueForKey:@"access_token"];
   

        // If the URL doesn't contain the access token, an error has occurred.
        if (!accessToken) {
            //NSString *error = [self.params valueForKey:@"error"];
            
            NSString *errorReason = [self.params valueForKey:@"error_reason"];
            
         //   BOOL userDidCancel = [errorReason isEqualToString:@"user_denied"];
       //     [self igDidNotLogin:userDidCancel];
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:errorReason
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            
            return YES;
        }
    
    NSString *refreshToken = [self.params  valueForKey:@"refresh_token"];
   // refreshToken = refreshToken ? refreshToken : [parameters valueForKey:@"refresh_token"];
    
    self.credential = [AFOAuthCredential credentialWithOAuthToken:[self.params valueForKey:@"access_token"] tokenType:[self.params  valueForKey:@"token_type"]];
    [self.credential setRefreshToken:refreshToken expiration:[NSDate dateWithTimeIntervalSinceNow:[[self.params  valueForKey:@"expires_in"] integerValue]]];
    
    [self setAuthorizationHeaderWithCredential:self.credential];
    
    NSLog(@"ACCESS TOKEN: %@", self.credential.accessToken);

    //Store the accessToken on userDefaults
    [[NSUserDefaults standardUserDefaults] setObject:self.credential.accessToken forKey:@"accessToken"];
	[[NSUserDefaults standardUserDefaults] synchronize];
    
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
    
    NSURL *url = [NSURL URLWithString:kOAuth2BaseURLString];
    
    testSDK = [TestSDKAPI clientWithBaseURL:url clientID:kClientIDString secret:kClientSecretString];


    [testSDK authenticateUsingOAuthWithPath:@"oauth/authorize/" scope:@"basic" redirectURI:[NSString stringWithFormat:@"ig%@://authorize", kClientIDString] success:^(AFOAuthCredential *credential) {
        
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
