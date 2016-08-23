////
////  MXNetWorkTool.m
////  登陆和注册
////
////  Created by soindy on 14-10-13.
////  Copyright (c) 2014年 soindy. All rights reserved.
////
//
//
//
//#import "MXNetWorkTool.h"
////#import "MXMD5.h"
////#import "MXUserObject.h"
////#import "MXLoginModelHeader.h"
//#import "Reachability.h"
////#import "MXLoginConfigureHeader.h"
//
//typedef NS_ENUM(NSInteger, MXLoginModuleCustomErrorCode) {
//    MXLoginModuleCustomErrorCode_NetDissconnect = -1000 // 网络连接错误
//};
//
//
///**
// *  网址
// */
//NSString *const MXServerAPIRootPath = @"http://123.57.221.76:80/commonend/api/fondle/";
//
///**
// *  Token
// */
//NSString *const MXServerToken = @"Zm9uZGxlX2lvc19hcGlfdXNlcjpmb25kbGVfaW9zX2FwaV91c2Vy";
//
///**
// *  错误码域
// */
//NSString *const MXServerAPIErrorDomain = @"TCAstroServerAPIErrorDomain";
//
///**
// *  自定义错误码域
// */
//NSString *const MXLoginModuleCustomErrorDomain = @"MXLoginModuleCustomErrorDomain";
//
///**
// *  添加用户与绑定设备信息action
// */
//NSString *const MXAPIAddUserWithBindingDeviceAction = @"addUserWithBindingDevice";
//
///**
// *  更新用户使用信息action
// */
//NSString *const MXAPIUpdateUserUsageInfoAction = @"updateUserUsageInfo";
//
///**
// *  更新用户设备信息action
// */
//NSString *const MXAPIUpdateDeviceInfoAction = @"updateDeviceInfo";
//
///**
// *  保存音乐信息action
// */
//NSString *const MXAPISaveMusicAction = @"saveMusic";
//
///**
// *  保存曲线信息action
// */
//NSString *const MXAPISaveCurveAction = @"saveCurve";
//
///**
// *  上传设备传感器数据action
// */
//NSString *const MXAPIPutSensorDataAction = @"putSensorData";
//
///**
// *  添加文章信息action
// */
//NSString *const MXAPIAddArticleAction = @"addArticle";
//
///**
// *  生成远程控制链接action
// */
//NSString *const MXAPIGenRemoteControlLinkAction = @"genRemoteControlLink";
//
//
//static AFHTTPRequestOperation *_operation;
//
//@implementation MXNetWorkTool
//
//+ (NSError *)errorWithCode:(NSNumber *)errorCode message:(NSString *)message {
//if (errorCode) {
//    NSInteger errCode = [errorCode integerValue];
//    if (errCode == 1 ) {
//        return nil;
//    } else {
//        // userInfo
//        NSString *errMsg = message.length ? message : [NSString stringWithFormat:@"Service error, code %ld", (long)errCode];
//        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
//                                  errMsg, NSLocalizedDescriptionKey, nil];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:errCode userInfo:userInfo];
//        return error;
//    }
//} else {
//#pragma mark - 服务器错误改掉以后换掉
//    // 错误码定义
//    //        NSString *errMsg = [NSString stringWithFormat:@"Invalid json object, no code found!"];
//    //        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
//    //                                  errMsg, NSLocalizedDescriptionKey, nil];
//    //        NSError *error = [NSError errorWithDomain:RWServerAPIErrorDomain code:RWAPICodeInvalidDataStruct userInfo:userInfo];
//    //        return error;
//    return nil;
//}
//}
//
//+ (NSError *)errorWithJsonObject:(id)jsonObject {
//    NSNumber *code = nil;
//    NSString *message = nil;
//    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
//        NSDictionary *result = [jsonObject objectForKey:@"result"];
//        if ([result isKindOfClass:[NSDictionary class]]) {
//            code = [result objectForKey:@"result"];
//            message = [result objectForKey:@"reason"];
//        }
//    }
//    return [MXNetWorkTool errorWithCode:code message:message];
//}
//
//
///**
// *  网络接口状态
// */
//+ (BOOL)networkReachabilityStatus{
//    BOOL isEnableWIFI = ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
//    BOOL isEnableIntent = ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
//    if (!isEnableIntent && !isEnableWIFI) {
//        return NO;
//    }else
//        return (isEnableWIFI || isEnableIntent);
//}
//
//+ (NSString *)jsonStringWithJsonObject:(id)object {
//    if (object) {
//        NSError *error = nil;
//        NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
//        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    }
//    return nil;
//}
//
///**
// *  发送一个GET请求
// *
// *  @param url     请求路径
// *  @param params  请求参数
// *  @param success 请求成功后的回调
// *  @param failure 请求失败后的回调
// */
//+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *error))failure
//{
//    if ([self networkReachabilityStatus]) {
//        // 1.创建请求管理对象
//        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//        mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//        NSLog(@"url----%@ parameters----%@",url,params);
//        // 2.发送请求
//        [mgr GET:url parameters:params
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//             NSError *error = [self errorWithJsonObject:response];
//             if (error) {
//                 failure(error);
//             }else{
//                 success(response);
//             }
//         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             failure(error);
//         }];
//    }else {
//        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:@"无网络" forKey:NSLocalizedDescriptionKey];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:MXNetDissConnectError userInfo:errorInfo];
//        failure (error);
//    }
//}
//
///**
// *  发送一个POST请求
// *
// *  @param url     请求路径
// *  @param params  请求参数
// *  @param success 请求成功后的回调
// *  @param failure 请求失败后的回调
// */
//+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
//{
//    if ([self networkReachabilityStatus]) {
//        // 1.创建请求管理对象
//        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//        
//        
//        mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//        // 2.发送请求
//        NSLog(@"url----%@ parameters----%@",url,params);
//        
//        [mgr POST:url parameters:params
//          success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//              NSError *error = [self errorWithJsonObject:response];
//              if (error) {
//                  failure(error);
//              }else{
//                  success(response);
//              }
//          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//              failure(error);
//          }];
//    }else {
//        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:@"无网络" forKey:NSLocalizedDescriptionKey];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:MXNetDissConnectError userInfo:errorInfo];
//        failure (error);
//    }
//}
//
///**
// *  发送一个POST请求(上传文件数据)
// *
// *  @param url           请求lujing
// *  @param params        请求参数
// *  @param formDataArray 文件参数
// *  @param success       请求成功的回调
// *  @param failure       请求失败的回调
// */
//+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    // 1.创建请求管理对象
//    if ([self networkReachabilityStatus]) {
//        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//        mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//        NSLog(@"url----%@ parameters----%@",url,params);
//        // 2.发送请求
//        [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
//            for (NSData *formData in formDataArray) {
//                [totalFormData appendPartWithFileData:formData name:@"file" fileName:@"voice.amr" mimeType:@"image/jpeg"];
//            }
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            NSError *error = [self errorWithJsonObject:response];
//            if (error) {
//                failure(error);
//            }else{
//                success(response);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            failure(error);
//        }];
//    }else {
//        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:@"无网络" forKey:NSLocalizedDescriptionKey];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:MXNetDissConnectError userInfo:errorInfo];
//        failure (error);
//    }
//}
//
//+ (void)uploadImage:(UIImage *)image withUrl:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure;
//{
//    NSLog(@"url----%@",url);
//    if ([self networkReachabilityStatus]) {
//        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            NSError *error = [self errorWithJsonObject:response];
//            if (error) {
//                failure(error);
//            }else{
//                success(response);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            failure(error);
//        }];
//    }else {
//        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:@"无网络" forKey:NSLocalizedDescriptionKey];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:MXNetDissConnectError userInfo:errorInfo];
//        failure (error);
//    }
//}
//
///**
// *  发送一个POST请求上传文件
// *
// *  @param data    数据
// *  @param url     url
// *  @param success 成功回调
// *  @param failure 失败回调
// */
//+ (void)uploadData:(NSData *)data withUrl:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure{
//    NSLog(@"url----%@",url);
//    [self postWithURL:url params:nil formDataArray:[NSArray arrayWithObject:data] success:^(id succe) {
//        success(succe);
//    } failure:^(NSError *error) {
//        failure(error);
//    }];
//}
//
///**
// *  下载语音文件
// */
//+ (void)downloadVoiceDateWithUrl:(NSString *)url success:(void (^)(NSData *))success failure:(void (^)(NSError *))failure{
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//        success([NSData dataWithData:[NSData dataWithContentsOfURL:location]]);
//    }];
//    [task resume];
//}
//
//
//+ (void)postWithAction:(NSString *)action
//            parameters:(NSDictionary*)parameters
//               success:(void (^)(AFHTTPRequestOperation* operation, id responseObject))success
//               failure:(void (^)(AFHTTPRequestOperation* operation, NSError* error))failure
//{
//    if (![self networkReachabilityStatus]) {
//        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:@"无网络" forKey:NSLocalizedDescriptionKey];
//        NSError *error = [NSError errorWithDomain:MXServerAPIErrorDomain code:MXNetDissConnectError userInfo:errorInfo];
//        failure (nil,error);
//        return;
//    }
//    NSError *error;
//    NSString* url = [MXServerAPIRootPath stringByAppendingString:action];
//    NSString *authValue = @"Basic Zm9uZGxlX2lvc19hcGlfdXNlcjpmb25kbGVfaW9zX2FwaV91c2Vy";
//    NSMutableDictionary* encodeParameters = [[NSMutableDictionary alloc] initWithCapacity:parameters.count];
//    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL * __unused stop) {
//        if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]) {
//            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:value options:kNilOptions error:nil];
//            if (jsonData) {
//                NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//                [encodeParameters setObject:jsonString forKey:key];
//            }
//        } else {
//            [encodeParameters setObject:value forKey:key];
//        }
//    }];
//    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    [request setTimeoutInterval:20.0f];
//    NSData *data = [NSJSONSerialization dataWithJSONObject:encodeParameters options:NSJSONWritingPrettyPrinted error:&error];
//    [request setHTTPBody:data];
//    [request setHTTPMethod:@"POST"];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    AFHTTPRequestOperation* operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@  %@",operation,response);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        failure (error.localizedDescription);
//        NSLog(@"%@  %@",operation, error.localizedDescription);
//    }];
//    [operation start];
//}
//
//+ (void)getWithAction:(NSString *)action
//           parameters:(NSString *)parameters
//              success:(void (^)(NSString *url))success
//              failure:(void (^)(NSString *errorStr))failure {
//    if (![self networkReachabilityStatus]) {
//        failure(@"无网络");
//        return;
//    }
//    
//    NSString* url = [MXServerAPIRootPath stringByAppendingString:action];
//    NSString *authValue = @"Basic Zm9uZGxlX2lvc19hcGlfdXNlcjpmb25kbGVfaW9zX2FwaV91c2Vy";
//    url = [url stringByAppendingString:[NSString stringWithFormat:@"/%@",parameters]];
//    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setTimeoutInterval:30.0f];
//    [request setHTTPMethod:@"GET"];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    AFHTTPRequestOperation* operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString* decodeStr = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
//        success(decodeStr);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        failure (error.localizedDescription);
//        NSLog(@"%@  %@",operation, error.localizedDescription);
//    }];
//    [operation start];
//}
//
//@end
///**
// *  用来封装数据的模型
// */
//@implementation MXFormData
//
//
//
//@end
//
