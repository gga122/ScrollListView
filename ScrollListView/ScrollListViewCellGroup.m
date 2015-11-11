//
//  ScrollListViewCellGroup.m
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListViewCellGroup.h"
#import "ScrollListCellView.h"

@interface ScrollListViewCellGroup ()

@property (nonatomic, strong) NSMutableArray *mCells;       //Contain all cells with same identifier.
@property (nonatomic, strong) NSMutableArray *mUsingCells;  //Contain 'USING' Cells
@property (nonatomic, strong) NSMutableArray *mReuseCells;  //Contain 'REUSE' Cells

@end

@implementation ScrollListViewCellGroup

#pragma mark - Overridden

- (NSString *)description {
    NSMutableString *tDesc = [NSMutableString stringWithString:[super description]];
    [tDesc appendString:[NSString stringWithFormat:@"Cells:%ld Using:%ld Reuse:%ld", self.mCells.count, self.mUsingCells.count, self.mReuseCells.count]];
    return tDesc;
}

#pragma mark - Intialize

- (instancetype)initWithIdentifer:(NSString *)identifier {
    NSParameterAssert(identifier);
    if (self = [super init]) {
        _identifier = identifier;
    }
    return self;
}

#pragma mark - Public Property

- (NSArray *)cells {
    if (self.mCells.count == 0) {
        return nil;
    }
    return [NSArray arrayWithArray:self.mCells];
}

#pragma mark - Private Property

- (NSMutableArray *)mCells {
    if (!_mCells) {
        _mCells = [NSMutableArray array];
    }
    return _mCells;
}

- (NSMutableArray *)mUsingCells {
    if (!_mUsingCells) {
        _mUsingCells = [NSMutableArray array];
    }
    return _mUsingCells;
}

- (NSMutableArray *)mReuseCells {
    if (!_mReuseCells) {
        _mReuseCells = [NSMutableArray array];
    }
    return _mReuseCells;
}

@end

@implementation ScrollListViewCellGroup (Extend)

- (void)addCell:(id)cell {
   
}

- (void)removeCell:(id)cell {
    
}

- (void)resetGroup {
    [self.mUsingCells removeAllObjects];
    [self.mReuseCells removeAllObjects];
    [self.mCells removeAllObjects];
}

- (ScrollListCellView *)preparedForReuseCell {
    if (self.mReuseCells.count == 0) {
        return nil;
    }
    ScrollListCellView *tCell = self.mReuseCells.firstObject;
    [tCell prepareForReuse];
    return tCell;
}

@end