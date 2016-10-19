//
//  LXDataSource.m
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "LXDataSource.h"
@interface LXDataSource()
@property(nonatomic,strong) NSArray *items;
@property(nonatomic,copy)NSString *cellIndentifier;
@property(nonatomic,copy)TableViewCellConfigureBlock configureCellBlock;
@end
@implementation LXDataSource
-(instancetype)init
{
    return nil;
}
-(instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)acellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aconfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIndentifier = acellIdentifier;
        self.configureCellBlock  = [aconfigureCellBlock copy];
    }
    return self;
}
-(id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return  self.items[(NSInteger) indexPath.row];
}

#pragma mark---uitableviewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:self.cellIndentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell,item);
    return cell;
    
}
@end
