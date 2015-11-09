//
//  ScrollListView.h
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

/**
 * Custom View For ListView OR OutlineView
 * 
 *
 */
 

#import <Cocoa/Cocoa.h>
#import "NSIndexPath+ScrollListView.h"

@class ScrollListCellView;

@interface ScrollListView : NSView

@end



@protocol ScrollListViewDataSource <NSObject>

@required

/**
 * Tell ScrollListView Row Count In Section
 */
- (NSInteger)scrollListView:(ScrollListView *)scrollListView numberOfRowInSection:(NSInteger)section;

/**
 * Row DisPlay.You should Always try to reuse cells by identifier.
 *
 */
- (ScrollListCellView *)scrollListView:(ScrollListCellView *)scrollListView cellForViewAtIndexPath:(NSIndexPath *)indexPath;

@optional

/**
 * Tell ScrollListView Section Count, default is '1'
 */
- (NSInteger)numberOfSectionsInTableView:(ScrollListView *)scrollListView;



@end


@protocol ScrollListViewDelegate <NSObject>


@end
