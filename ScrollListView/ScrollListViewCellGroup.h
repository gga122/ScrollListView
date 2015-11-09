//
//  ScrollListViewCellGroup.h
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollListViewCellGroup : NSObject

- (id)initWithIdentifer:(NSString *)identifier;

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, strong, readonly) NSArray *cells;

@end

