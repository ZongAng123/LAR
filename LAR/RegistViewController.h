//
//  RegistViewController.h
//  LAR
//
//  Created by 纵昂 on 2017/2/20.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RegistSuccessBlock)(NSString *name, NSString *pwd);
@interface RegistViewController : UIViewController
- (id)initWithSuccessBlock:(RegistSuccessBlock)registSuccessBlock;
@end
