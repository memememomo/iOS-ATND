//
//  Samples.m
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "Samples.h"


@implementation Samples

- (void)dealloc
{
	[atnd_ release];
	[super dealloc];
}

- (void)main
{
	[self searchKeywordAsyc];
	[self searchKeyword];
	[self searchNickname];
	[self searchKeywordOr];
}

- (void)searchKeyword
{
	ATND *atnd = [[[ATND alloc] init] autorelease];
	
	id query = [atnd queryEvents];
	[query addKeywordOr:@"HTML5"];
	[query addYm:@"201102"];
	[query addYm:@"201103"];
	[query addYm:@"201104"];
	
	NSDictionary *res = [atnd get:query];
	
	for (NSDictionary *event in [res objectForKey:@"events"]) {
		NSLog(@"%@:%@", [event objectForKey:@"title"], [event objectForKey:@"event_url"]);
	}
}

- (void)searchNickname
{
	NSString *myNickname = @"memememomo";
	
	ATND *atnd = [[[ATND alloc] init] autorelease];
	
	id query = [atnd queryUsers];
	[query addNickname:myNickname];
	
	NSDictionary *res = [atnd get:query];
	
	for (NSDictionary *event in [res objectForKey:@"events"]) {
		for (NSDictionary *user in [event objectForKey:@"users"]) {
			if ([[user objectForKey:@"nickname"] isEqualToString:myNickname]) {
				NSString *status = [[user objectForKey:@"status"] intValue] ? @"出席" : @"キャンセル待ち";
				NSLog(@"%@:%@", [event objectForKey:@"title"], status);
			}
		}
	}
}

- (void)searchKeywordOr
{
	ATND *atnd = [[[ATND alloc] init] autorelease];
	
	id query = [atnd queryEvents];
	[query addYm:@"201102"];
	[query addYm:@"201103"];
	[query addKeywordOr:@"perl"];
	[query addKeywordOr:@"ruby"];
	[query addKeywordOr:@"python"];
	[query addKeywordOr:@"iphone"];
	
	NSDictionary *res = [atnd get:query];
	
	for (NSDictionary *event in [res objectForKey:@"events"]) {
		NSString *title = [event objectForKey:@"title"];
		NSString *place = [event objectForKey:@"place"];
		NSString *address = [event objectForKey:@"address"];
		NSString *eventUrl = [event objectForKey:@"event_url"];
		NSString *longitude = [event objectForKey:@"lon"];
		NSString *latitude = [event objectForKey:@"lat"];
		NSLog(@"%@ %@(%@) %@ [%@, %@]", title, place, address, eventUrl, longitude, latitude);
	}
}


#pragma mark -
#pragma mark Async

- (void)searchKeywordAsyc
{
	atnd_ = [[ATND alloc] init];
	atnd_.delegate = self;
	
	id query = [atnd_ queryEvents];
	[query addKeyword:@"perl"];
	
	NSLog(@"===== Async Start =====");
	[atnd_ getAsync:query];
}

- (void)requestFinished:(NSDictionary *)response
{
	for (NSDictionary *event in [response objectForKey:@"events"]) {
		NSLog(@"===== %@(%@) [%@, %@] =====", 
			  [event objectForKey:@"title"], 
			  [event objectForKey:@"event_url"],
			  [event objectForKey:@"lon"], 
			  [event objectForKey:@"lat"]);
	}
}

- (void)requestFailed:(NSError *)error
{
}

@end
