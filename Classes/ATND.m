//
//  DownloadJSON.m
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "ATND.h"
#import "JSON.h"

static NSString *baseUrl = @"http://api.atnd.org/";


@implementation ATND


@synthesize delegate;


- (ASIHTTPRequest *)createRequest:(ATNDQuery *)query
{
	NSString *urlStr = [NSString stringWithFormat:@"%@%@", baseUrl, [query asString]];
	return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlStr]];
}

- (NSDictionary *)get:(ATNDQuery *)query
{
	ASIHTTPRequest *request = [self createRequest:query];
	[request startSynchronous];
	NSError *error = [request error];
	if ( !error ) {
		NSString *response = [request responseString];
		NSDictionary *jsonItem = [response JSONValue];
		return jsonItem;
	} else {
		return nil;
	}
}

- (void)getAsync:(ATNDQuery *)query
{
	ASIHTTPRequest *request = [self createRequest:query];
	[request setDelegate:self];
	[request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
	NSString *responseString = [request responseString];
	[self.delegate requestFinished:[responseString JSONValue]];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	[self.delegate requestFailed:[request error]];
}

- (ATNDQuery *)queryEvents 
{
	return [[[ATNDQueryEvents alloc] init] autorelease];
}

- (ATNDQuery *)queryUsers
{
	return [[[ATNDQueryUsers alloc] init] autorelease];
}

@end
