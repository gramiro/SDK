//
//  TestSDKAPI.h
//  SDKTest
//
//  Created by Ramiro Guerrero on 21/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOAuth2Client.h"

@protocol InstagramRequestsDelegate <NSObject>

-(void)loadFollowsWithArray:(NSArray *)array;
-(void)loadFollowedByWithArray:(NSArray *)array;

@end

@protocol HandleURLLoginDelegate <NSObject>

-(void)performLoginFromHandle;

@end

@interface TestSDKAPI : AFOAuth2Client

@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, retain) NSArray *scopes;
@property (nonatomic, strong) NSObject <HandleURLLoginDelegate> *loginDelegate;


//Login-logout methods
-(BOOL)handleOpenURL:(NSURL *)url;
+(TestSDKAPI *)sharedClient;
-(void)authorizeWithScopes:(NSArray *)scopes;
-(void)logout;
-(BOOL)isLoginRequired;
-(BOOL)isCredentialExpired;


//USERS ENDPOINT
-(void)getUserInfoWithUserID:(NSString*)userID AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;
-(void)getAuthenticatedUserFeedWithParameters:(NSDictionary*)params AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;
-(void)getUserMediaWithUserID:(NSString*)userID Parameters:(NSDictionary*)params AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;
-(void)getAuthenticatedUserLikedMediaWithParameters:(NSDictionary*)params AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;
-(void)searchUserWithQuery:(NSString*)query AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;

//RELATIONSHIP ENDPOINT
-(void)getFollowedByWithUserId:(NSString *)userID Delegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getFollowsWithUserId:(NSString *)userID Delegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)postRelationship:(NSString *)action WithUserId:(NSString *)userID Delegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getRequestedByWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;
-(void)getRelationshipWithUserID:(NSString*)userID AndWithDelegate:(NSObject <InstagramRequestsDelegate> *)delegate;


//MEDIA ENDPOINT
-(void)getMediaWithMediaID:(NSString *)mediaID AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getMediaSearchWithParams:(NSDictionary *)mediaParams AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getPopularMediaWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;


//LIKES ENDPOINT
-(void)getLikesOfMediaId:(NSString *)mediaID AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)postLikeOnMediaWithMediaId:(NSString *)mediaID AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)removeLikeOnMediaWithMediaId:(NSString *)mediaID AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;

//TAGS ENDPOINT
-(void)getTagInfoWithTagName:(NSString *)tagString AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getRecentTags:(NSString *)tagID WithParams:(NSDictionary *)tagParams AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
-(void)getSearchTagsWithTagName:(NSString *)tagString AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;

//GEO ENDPOINT
-(void)getGeoWithGeoId:(NSString *)geoId WithParams:(NSDictionary *)geoParams AndWithDelegate:(NSObject<InstagramRequestsDelegate> *)delegate;
@end
