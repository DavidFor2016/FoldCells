//
//  DataModel.h
//  FoldCells
//
//  Created by Yesi on 16/8/26.
//  Copyright © 2016年 Yesi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

/** name */
@property (nonatomic, strong) NSString *name;
/** time */
@property (nonatomic, strong) NSString *time;
/** des */
@property (nonatomic, strong) NSString *des;
/** iimage */
@property (nonatomic, strong) NSString *image;
/** isFold */
@property (nonatomic, assign) BOOL isFold;
@end
