//
//  TopTableViewCell.h
//  FoldCells
//
//  Created by Yesi on 16/8/26.
//  Copyright © 2016年 Yesi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface TopTableViewCell : UITableViewCell

/** Button Click */
@property (nonatomic, copy)  void(^buttonClickBlock)(UIImageView *imageView);

/** isfold */
@property (nonatomic, assign) BOOL isFold;

/** Model */
@property (nonatomic, strong) DataModel *model;

@end
