//
//  UISearchBar+DBBlocks.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UISearchBar+DBBlocks.h"
#import <objc/runtime.h>

/* Only for convenience and readabilty in delegate methods */
typedef BOOL (^DB_UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^DB_UISearchBarVoidBlock) (UISearchBar *searchBar);
typedef void (^DB_UISearchBarSearchTextBlock) (UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^DB_UISearchBarInRangeReplacementTextBlock) (UISearchBar *searchBar,NSRange range,NSString *text);
typedef void (^DB_UISearchBarScopeIndexBlock)(UISearchBar *searchBar, NSInteger selectedScope);

static const void *DB_UISearchBarDelegateKey = &DB_UISearchBarDelegateKey;
static const void *DB_UISearchBarShouldBeginEditingKey = &DB_UISearchBarShouldBeginEditingKey;
static const void *DB_UISearchBarTextDidBeginEditingKey = &DB_UISearchBarTextDidBeginEditingKey;
static const void *DB_UISearchBarShouldEndEditingKey = &DB_UISearchBarShouldEndEditingKey;
static const void *DB_UISearchBarTextDidEndEditingKey = &DB_UISearchBarTextDidEndEditingKey;
static const void *DB_UISearchBarTextDidChangeKey = &DB_UISearchBarTextDidChangeKey;
static const void *DB_UISearchBarShouldChangeTextInRangeKey = &DB_UISearchBarShouldChangeTextInRangeKey;
static const void *DB_UISearchBarSearchButtonClickedKey = &DB_UISearchBarSearchButtonClickedKey;
static const void *DB_UISearchBarBookmarkButtonClickedKey = &DB_UISearchBarBookmarkButtonClickedKey;
static const void *DB_UISearchBarCancelButtonClickedKey = &DB_UISearchBarCancelButtonClickedKey;
static const void *DB_UISearchBarResultsListButtonClickedKey = &DB_UISearchBarResultsListButtonClickedKey;
static const void *DB_UISearchBarSelectedScopeButtonIndexDidChangeKey = &DB_UISearchBarSelectedScopeButtonIndexDidChangeKey;

@implementation UISearchBar (DBBlocks)

#pragma mark UISearchBar delegate Methods
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
{
    DB_UISearchBarReturnBlock block = searchBar.db_completionShouldBeginEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionTextDidBeginEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]){
        [delegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    DB_UISearchBarReturnBlock block = searchBar.db_completionShouldEndEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionTextDidEndEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [delegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    DB_UISearchBarSearchTextBlock block = searchBar.db_completionTextDidChangeBlock;
    if (block) {
        block(searchBar,searchText);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [delegate searchBar:searchBar textDidChange:searchText];
    }
}
// called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    DB_UISearchBarInRangeReplacementTextBlock block = searchBar.db_completionShouldChangeTextInRangeBlock;
    if (block) {
        return block(searchBar,range,text);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]){
        return [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionSearchButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionBookmarkButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]){
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionCancelButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]){
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    DB_UISearchBarVoidBlock block = searchBar.db_completionResultsListButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]){
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    DB_UISearchBarScopeIndexBlock block = searchBar.db_completionSelectedScopeButtonIndexDidChangeBlock;
    if (block) {
        block(searchBar,selectedScope);
    }
    id delegate = objc_getAssociatedObject(self, DB_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]){
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}

#pragma mark Block setting/getting methods
- (BOOL (^)(UISearchBar *))db_completionShouldBeginEditingBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarShouldBeginEditingKey);
}

- (void)setDb_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditingBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarShouldBeginEditingKey, searchBarShouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionTextDidBeginEditingBlock
{
    return objc_getAssociatedObject(self,DB_UISearchBarTextDidBeginEditingKey);
}

- (void)setDb_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *))searchBarTextDidBeginEditingBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarTextDidBeginEditingKey, searchBarTextDidBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))db_completionShouldEndEditingBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarShouldEndEditingKey);
}

- (void)setDb_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldEndEditingBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarShouldEndEditingKey, searchBarShouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionTextDidEndEditingBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarTextDidEndEditingKey);
}

- (void)setDb_completionTextDidEndEditingBlock:(void (^)(UISearchBar *))searchBarTextDidEndEditingBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarTextDidEndEditingKey, searchBarTextDidEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSString *))db_completionTextDidChangeBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarTextDidChangeKey);
}

- (void)setDb_completionTextDidChangeBlock:(void (^)(UISearchBar *, NSString *))searchBarTextDidChangeBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarTextDidChangeKey, searchBarTextDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *, NSRange, NSString *))db_completionShouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarShouldChangeTextInRangeKey);
}

- (void)setDb_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRangeBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarShouldChangeTextInRangeKey, searchBarShouldChangeTextInRangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionSearchButtonClickedBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarSearchButtonClickedKey);
}

- (void)setDb_completionSearchButtonClickedBlock:(void (^)(UISearchBar *))searchBarSearchButtonClickedBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarSearchButtonClickedKey, searchBarSearchButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionBookmarkButtonClickedBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarBookmarkButtonClickedKey);
}

- (void)setDb_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *))searchBarBookmarkButtonClickedBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarBookmarkButtonClickedKey, searchBarBookmarkButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionCancelButtonClickedBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarCancelButtonClickedKey);
}

- (void)setDb_completionCancelButtonClickedBlock:(void (^)(UISearchBar *))searchBarCancelButtonClickedBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarCancelButtonClickedKey, searchBarCancelButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))db_completionResultsListButtonClickedBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarResultsListButtonClickedKey);
}

- (void)setDb_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *))searchBarResultsListButtonClickedBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarResultsListButtonClickedKey, searchBarResultsListButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSInteger))db_completionSelectedScopeButtonIndexDidChangeBlock
{
    return objc_getAssociatedObject(self, DB_UISearchBarSelectedScopeButtonIndexDidChangeKey);
}

- (void)setDb_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *, NSInteger))searchBarSelectedScopeButtonIndexDidChangeBlock
{
    [self db_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, DB_UISearchBarSelectedScopeButtonIndexDidChangeKey, searchBarSelectedScopeButtonIndexDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void)db_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)self) {
        objc_setAssociatedObject(self, DB_UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UISearchBarDelegate>)self;
    }
}

@end
