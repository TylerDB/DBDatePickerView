//
//  UISearchBar+DBBlocks.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISearchBar (DBBlocks)

@property (copy, nonatomic) BOOL (^db_completionShouldBeginEditingBlock)(UISearchBar *searchbar);
@property (copy, nonatomic) void (^db_completionTextDidBeginEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) BOOL (^db_completionShouldEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionTextDidEndEditingBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionTextDidChangeBlock)(UISearchBar *searchBar, NSString *searchText);
@property (copy, nonatomic) BOOL (^db_completionShouldChangeTextInRangeBlock)(UISearchBar *searchBar, NSRange range, NSString *replacementText);
@property (copy, nonatomic) void (^db_completionSearchButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionBookmarkButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionCancelButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionResultsListButtonClickedBlock)(UISearchBar *searchBar);
@property (copy, nonatomic) void (^db_completionSelectedScopeButtonIndexDidChangeBlock)(UISearchBar *searchBar, NSInteger selectedScope);

- (void)setDb_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldBeginEditingBlock;
- (void)setDb_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidBeginEditingBlock;
- (void)setDb_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *searchBar))searchBarShouldEndEditingBlock;
- (void)setDb_completionTextDidEndEditingBlock:(void (^)(UISearchBar *searchBar))searchBarTextDidEndEditingBlock;
- (void)setDb_completionTextDidChangeBlock:(void (^)(UISearchBar *searchBar, NSString *text))searchBarTextDidChangeBlock;
- (void)setDb_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *searchBar, NSRange range, NSString *text))searchBarShouldChangeTextInRangeBlock;
- (void)setDb_completionSearchButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarSearchButtonClickedBlock;
- (void)setDb_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarBookmarkButtonClickedBlock;
- (void)setDb_completionCancelButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarCancelButtonClickedBlock;
- (void)setDb_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *searchBar))searchBarResultsListButtonClickedBlock;
- (void)setDb_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *searchBar, NSInteger index))searchBarSelectedScopeButtonIndexDidChangeBlock;

@end

NS_ASSUME_NONNULL_END
