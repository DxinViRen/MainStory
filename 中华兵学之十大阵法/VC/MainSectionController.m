//
//  MainSectionController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MainSectionController.h"

@implementation MainSectionController

- (NSString *)cellInderfierWithModel:(id<MainSectionModelProtocol>)model{
    if([model respondsToSelector:@selector(cellInderifier)]){
        return model.cellInderifier;
    }
    return model.cellClassName;
}

- (NSInteger)numberOfItems{
    return self.object.dataArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    id<MainSectionModelProtocol>model = [self.object.dataArray objectAtIndex:index];
    if([model respondsToSelector:@selector(cellHeight)] && [model respondsToSelector:@selector(cellWeighght)]){
        return CGSizeMake(model.cellWeighght, model.cellHeight);
    }
    return CGSizeMake(self.collectionContext.containerSize.width, model.cellHeight);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    id<MainSectionModelProtocol> model = [self.object.dataArray objectAtIndex:index];
    NSString *cellIdentifier = [self cellInderfierWithModel:model];
    UICollectionViewCell<MainCellProtocol> *cell = [self.collectionContext dequeueReusableCellOfClass:NSClassFromString(model.cellClassName) withReuseIdentifier:cellIdentifier forSectionController:self atIndex:index];
    if(self.configCellBlock){
        self.configCellBlock(model, index, cell);
    }
    cell.model = model;
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index{
    @WeakObj(self);
    if(self.didSelectCellBlock)
    self.didSelectCellBlock([selfWeak.object.dataArray objectAtIndex:index], index);
}

- (void)didUpdateToObject:(id)object
{
    self.object = object;
}
@end
