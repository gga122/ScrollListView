//
//  ScrollListDocumentView.h
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * ScrollListDocumentView is used for ScrollListView's Inner ScrollView
 * ScrollListDocumentView is the contentView For Inner Scrollview
 */

@interface ScrollListDocumentView : NSView

/**
 * @brief Register/Remove View Notifications
 * In method 'registerViewNotifications' will default call 'unRegisterViewNotifications' at first
 */
- (void)registerViewNotifications;
- (void)unRegisterViewNotifications;


@end
