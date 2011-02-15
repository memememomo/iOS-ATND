//
//  DownloadJSONQueryUsers.m
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "ATNDQueryUsers.h"


@implementation ATNDQueryUsers

- (id)init
{
	if ( self = [super init] ) {
		apiBase_ = @"events/users";
	}
	
	return self;
}



- (void)addEventId:(NSString *)eventId
{
    [self add:eventId AndKey:@"event_id"];
}


- (void)addUserId:(NSString *)userId
{
    [self add:userId AndKey:@"user_id"];
}


- (void)addNickname:(NSString *)nickname
{
    [self add:nickname AndKey:@"nickname"];
}


- (void)addTwitterId:(NSString *)twitterId
{
    [self add:twitterId AndKey:@"twitter_id"];
}


- (void)addOwnerId:(NSString *)ownerId
{
    [self add:ownerId AndKey:@"owner_id"];
}


- (void)addOwnerNickname:(NSString *)ownerNickname
{
    [self add:ownerNickname AndKey:@"owner_nickname"];
}


- (void)addOwnerTwitterId:(NSString *)ownerTwitterId
{
    [self add:ownerTwitterId AndKey:@"owner_twitter_id"];
}


@end
