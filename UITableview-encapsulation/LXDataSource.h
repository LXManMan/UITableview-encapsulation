//
//  LXDataSource.h
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(id cell ,id item);
@interface LXDataSource : NSObject<UITableViewDataSource>
-(instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)acellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aconfigureCellBlock;
-(id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
