//
//  DownloadJSONQueryUsers.h
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "ATNDQuery.h"


@interface ATNDQueryUsers : ATNDQuery {

}

- (void)addEventId:(NSString *)eventId;
- (void)addUserId:(NSString *)userId;
- (void)addNickname:(NSString *)nickname;
- (void)addTwitterId:(NSString *)twitterId;
- (void)addOwnerId:(NSString *)ownerId;
- (void)addOwnerNickname:(NSString *)ownerNickname;
- (void)addOwnerTwitterId:(NSString *)ownerTwitterId;

@end
