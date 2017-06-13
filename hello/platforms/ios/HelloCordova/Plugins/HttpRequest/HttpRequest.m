//
//  HttpRequest.m
//  TestPro
//
//  Created by macdong on 2017/4/26.
//
//

#import <AVFoundation/AVFoundation.h>
#import "HttpRequest.h"
#import <Cordova/CDV.h>
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"

@interface HttpRequest ()<UIWebViewDelegate>

//@property (strong, nonatomic) UIWebView *webView;
@property (nonatomic,strong) AFHTTPSessionManager *mananger;

@end
@implementation HttpRequest

- (void)httppost:(CDVInvokedUrlCommand *)command
{
    // 这里是登录的相关代码......
    NSString *urlAdr=[command.arguments objectAtIndex:0];
    NSString *method=[command.arguments objectAtIndex:1];
    NSDictionary *dict=[command.arguments objectAtIndex:2];
   NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    //
    if(dict){
        [parameters setObject:[NSNull null] forKey:@""];
    }else{
      for(NSString *temp in [dict allKeys]){
        NSString *val=[dict objectForKey:temp];
        [parameters setObject:val forKey:temp];
       }
    }
    //NSString *callback=[dict objectForKey:@"callback"];
   // AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    //[securityPolicy setAllowInvalidCertificates:YES];
    
    AFHTTPRequestOperationManager *mananger = [AFHTTPRequestOperationManager manager];
   // [mananger setSecurityPolicy:securityPolicy];
    mananger.requestSerializer=[AFJSONRequestSerializer serializer];
    //mananger.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    
    
   
    
    //你的接口地址
    
    NSString *url=urlAdr;
    
    if(method==[NSString stringWithFormat:@"post"]){
        
        //3.执行post请求
        [mananger POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id  responseObject) {
            //NSLog(@"post请求成功:%@", responseObject);
            NSDictionary *data=(NSDictionary *) responseObject;
            NSString *jsonString = nil;
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted  error:&error];
            if (! jsonData) {
                NSLog(@"Got an error: %@", error);
            } else {
                jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                //[jsonString stringByReplacingOccurrencesOfString:@"\"" withString:@"\'"];
            }
            
            jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
            
            jsonString=[jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            //NSString *jsStr = [NSString stringWithFormat:@"%@('%@')",callback,jsonString];
            //[self.commandDelegate evalJs:jsStr];
            CDVPluginResult *pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jsonString];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"失败:%@", error);
        }];
        
        
        
    }else{
        
        //3.执行get请求
        [mananger GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id  responseObject) {
            //NSLog(@"post请求成功:%@", responseObject);
            NSDictionary *data=(NSDictionary *) responseObject;
            NSString *jsonString = nil;
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted  error:&error];
            if (! jsonData) {
                NSLog(@"Got an error: %@", error);
            } else {
                jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                //[jsonString stringByReplacingOccurrencesOfString:@"\"" withString:@"\'"];
            }
            
            jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
            
            jsonString=[jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            //NSString *jsStr = [NSString stringWithFormat:@"%@('%@')",callback,jsonString];
            //[self.commandDelegate evalJs:jsStr];
            CDVPluginResult *pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jsonString];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"失败:%@", error);
        }];
        
        
    }
    
    
}


@end
