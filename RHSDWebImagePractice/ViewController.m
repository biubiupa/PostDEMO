//
//  ViewController.m
//  RHSDWebImagePractice
//
//  Created by malf on 2017/12/25.
//  Copyright © 2017年 DST. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageview=[[UIImageView alloc] init];
    imageview.frame=self.view.frame;
    [self.view addSubview:imageview];
    NSURL *imageURL=[NSURL URLWithString:@"http://a3.topitme.com/a/d0/6c/111699872446f6cd0al.jpg"];
    [imageview sd_setImageWithURL:imageURL];
//    监测网络状态
   
//    网络请求
    NSString *urlString=@"http://192.168.2.62:8089/diqin_app/user";
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    NSDictionary *dict=@{@"head":
  @{
        @"aid":@"1and6uu",
        @"ver":@"1.0",
        @"ln": @"cn",
        @"mod":@"iOS",
        @"de": @"2017-11-14 00:00:00",
        @"sync":@"1",
        @"uuid":@"188111",
        @"cmd":@"10001",
        @"chcode": @" ef19843298ae8f2134f "
    },@"con":
  @{
        @"account":@"1232323",
        @"password":@"e10adc3949ba59abbe56e057f20f883e",
        @"userType":@"0"}
};
    NSData *para=[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *jsonstr=[[NSString alloc] initWithData:para encoding:NSUTF8StringEncoding];
    [manager POST:urlString parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"=============================================");
        NSLog(@"成功回调:responseObject:%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error:%@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
