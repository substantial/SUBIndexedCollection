#import "SUBIndexedCollection.h"

@interface SUBIndexedCollection ()
@property (nonatomic, strong, readonly) NSMutableArray *items;
@end

static SUBIndexedCollection *instance;

@implementation SUBIndexedCollection

+ (instancetype)collectionWithItems:(NSArray *)items
{
    SUBIndexedCollection *collection = [[self alloc] initWithItems:items];
    instance = collection;
    
    return collection;
}

+ (instancetype)sharedInstance
{
    if (!instance) {
        NSAssert(NO, @"No instance available!");
    }
    
    return instance;
}

- (instancetype)initWithItems:(NSArray *)items
{
    if (self = [super init]) {
        _items = [NSMutableArray arrayWithArray:items];
        _selected = (items.count == 0) ? nil : items[0];
    }
    
    return self;
}

- (NSInteger)count
{
    return self.items.count;
}

- (void)setSelected:(id)selected
{
    if ([self.items containsObject:selected]) {
        _selected = selected;
    } else {
        NSAssert(NO, @"Item doesn't exist in collection!");
    }
}

- (id)itemAtIndex:(NSInteger)index
{
    return [self.items objectAtIndex:index];
}

- (NSInteger)indexOfItem:(id)item
{
    return [self.items indexOfObject:item];
}

- (NSInteger)selectedIndex
{
    return [self.items indexOfObject:self.selected];
}

- (void)removeItem:(id)item
{
    NSInteger index = [self indexOfItem:item];
    if (index == NSNotFound) {
        return;
    }
    
    [self.items removeObjectAtIndex:index];
    
    if (self.count == 0) {
        _selected = nil;
    } else if (index == self.count) {
        self.selected = [self.items objectAtIndex:index - 1];
    } else {
        self.selected = [self.items objectAtIndex:index];
    }
}

- (void)addItem:(id)item
{
    [self.items insertObject:item atIndex:0];
    self.selected = item;
}

- (NSArray *)itemsAfterSelectedCount:(NSInteger)count
{
    NSInteger index = self.selectedIndex + 1;
    NSInteger length = MIN((self.count - index), count);
    return [self.items subarrayWithRange:NSMakeRange(index, length)];
}

@end


