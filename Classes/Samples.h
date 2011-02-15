//
//  Samples.h
//  ATND
//
//  Created by Your Name on 11/02/15.
//  Copyright 2011 Your Org Name. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATND.h"


@interface Samples : NSObject<ATNDDelegate> {
	ATND *atnd_;
}

- (void)main;
- (void)searchKeywordAsyc;
- (void)searchKeyword;
- (void)searchNickname;
- (void)searchKeywordOr;

@end
