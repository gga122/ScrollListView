//
//  AppDelegate.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "AppDelegate.h"
#import "ScrollListView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    ScrollListView *listView = [[ScrollListView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.window.contentView addSubview:listView];
    listView.frame = CGRectMake(200, 100, 400, 500);
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 50, 100)];
    view.layer = [CALayer layer];
    view.wantsLayer = YES;
    view.layer.backgroundColor = [[NSColor greenColor] CGColor];
    listView.scrollListHeaderView = view;
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
