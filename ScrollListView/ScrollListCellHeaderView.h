//
//  ScrollListCellHeaderView.h
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Single CellHeaderView For ScrollListView
 * You should subclass this if you want to design your own cellHeaderView.
 * You should try you best to reuse instance of this class or subclass of this class.
 * You should add your customView to 'ContentView'
 */

@interface ScrollListCellHeaderView : NSView

@end