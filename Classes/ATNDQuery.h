//
//  DownloadJSONQuery.h
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ATNDQuery : NSObject {
	NSMutableDictionary *query_;
	
	NSString *apiBase_;
	NSInteger count_;
	NSInteger start_;
}

- (void)add:(NSString *)value AndKey:(NSString *)key;
- (NSString *)asString;
- (void)setCount:(NSInteger)count;
- (void)setStart:(NSInteger)start;

@end
