#import <Foundation/Foundation.h>

@class SUBItem;

@interface SUBIndexedCollection : NSObject

@property (nonatomic, readonly) NSInteger count;
@property (nonatomic, strong) NSObject *selected;
@property (nonatomic, readonly) NSInteger selectedIndex;

+ (instancetype)collectionWithItems:(NSArray *)items;
+ (instancetype)sharedInstance;

- (id)itemAtIndex:(NSInteger)index;
- (NSInteger)indexOfItem:(id)item;
- (void)addItem:(id)item;
- (void)removeItem:(id)item;
- (NSArray *)itemsAfterSelectedCount:(NSInteger)count;

@end
