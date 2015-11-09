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

@protocol ScrollListViewDataSource, ScrollListViewDelegate;

@interface ScrollListView : NSView

@property (nonatomic, weak) id<ScrollListViewDataSource> dataSource;
@property (nonatomic, weak) id<ScrollListViewDelegate> delegate;

@property (nonatomic, strong) NSView *scrollListHeaderView; //accessory view for above content. default is nil
@property (nonatomic, strong) NSView *scrollListFooterView; //accessory view below content. default is nil

/**
 * Used by the delegate to acquire an already allocated cell. allocate a new one if return nil.
 */
- (ScrollListCellView *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

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
