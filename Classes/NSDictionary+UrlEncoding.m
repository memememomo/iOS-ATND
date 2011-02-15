//
//  NSDictionary+UrlEncoding.m
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import "NSDictionary+UrlEncoding.h"


#import "NSDictionary+UrlEncoding.h" 
// helper function: get the string form of any object 
static NSString *toString(id object) { 
	return [NSString stringWithFormat: @"%@", object]; 
} 
// helper function: get the url encoded string form of any object 
static NSString *urlEncode(id object) { 
	NSString *string = toString(object); 
	return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]; 
} 

static NSString *joinByEqual(id key, id value) {
	return [NSString stringWithFormat:@"%@=%@", urlEncode(key), urlEncode(value)];
}

@implementation NSDictionary (UrlEncoding) 
- (NSString*) urlEncodedString { 
	NSMutableArray *parts = [NSMutableArray array]; 
	for (id key in self) { 
		id value = [self objectForKey: key]; 
		
		if ([value isKindOfClass:[NSString class]]) {
			[parts addObject:joinByEqual(key, value)];
		} 
		else if ([value isKindOfClass:[NSArray class]]) {
			for ( NSString *v in value ) {
				[parts addObject:joinByEqual(key, v)];
			}
		}
	} 
	return [parts componentsJoinedByString: @"&"]; 
} 

@end 