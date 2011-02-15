//
//  DownloadJSON.h
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATNDQuery.h"
#import "ATDNQueryEvents.h"
#import "ATNDQueryUsers.h"
#import "ASIHTTPRequest.h"


@protocol ATNDDelegate
- (void)requestFinished:(NSDictionary *)response;
- (void)requestFailed:(NSError *)error;
@end


@interface ATND : NSObject {
	id<ATNDDelegate> delegate;
}

@property (nonatomic, assign) id<ATNDDelegate> delegate;

- (ASIHTTPRequest *)createRequest:(ATNDQuery *)query;
- (NSDictionary *)get:(ATNDQuery *)query;
- (void)getAsync:(ATNDQuery *)query;
- (ATNDQuery *)queryEvents;
- (ATNDQuery *)queryUsers;

@end
