//
//  DownloadJSONQuery.m
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "ATNDQuery.h"
#import "NSDictionary+UrlEncoding.h"


@implementation ATNDQuery


- (void)dealloc
{
	[apiBase_ release];
	[query_ release];
	[super dealloc];
}

- (id)init
{
	if ( self = [super init] ) {
		query_ = [[NSMutableDictionary alloc] init];
		[query_ setObject:@"json" forKey:@"format"];
	}
	return self;
}

- (void)add:(NSString *)value AndKey:(NSString *)key
{
	NSMutableArray *q = [query_ objectForKey:key];
	if ( q == nil ) {
		q = [[[NSMutableArray alloc] init] autorelease];
	}
	[q addObject:value];
	[query_ setObject:q forKey:key];
}

- (NSString *)asString
{
	return [NSString stringWithFormat:@"%@/?%@", apiBase_, [query_ urlEncodedString]];
}

- (void)setCount:(NSInteger)count
{
	count_ = count;
	[query_ setObject:[NSString stringWithFormat:@"%d", count] forKey:@"count"];
}

- (void)setStart:(NSInteger)start
{
	start_ = start;
	[query_ setObject:[NSString stringWithFormat:@"%d", start] forKey:@"start"];
}

@end
