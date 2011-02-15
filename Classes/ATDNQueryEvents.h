//
//  DownloadJSONQueryEvents.h
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//


#import "ATNDQuery.h"

@interface ATNDQueryEvents : ATNDQuery {

}

- (void)addEventId:(NSString *)eventId;
- (void)addKeyword:(NSString *)keyword;
- (void)addKeywordOr:(NSString *)keywordOr;
- (void)addYm:(NSString *)ym;
- (void)addYmd:(NSString *)ymd;
- (void)addUserId:(NSString *)userId;
- (void)addNickname:(NSString *)nickname;
- (void)addTwitterId:(NSString *)twitterId;
- (void)addOwnerId:(NSString *)ownerId;
- (void)addOwnerNickname:(NSString *)ownerNickname;
- (void)addOwnerTwitterId:(NSString *)ownerTwitterId;

@end
