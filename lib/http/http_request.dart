import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'interceptor/interceptor.dart';


class Http {
  static final Http _instance = Http._internal();
  factory Http() => _instance;

  static late final Dio dio;

  List<CancelToken?> pendingRequest = [];

  Http._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();

    dio = Dio(options);

    // 添加request拦截器
    dio.interceptors.add(RequestInterceptor());
    // 添加response拦截器
    dio.interceptors.add(ResponseInterceptor());
    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
    // 添加cache拦截器
    dio.interceptors.add(NetCacheInterceptor());
    // 添加retry拦截器
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (PROXY_ENABLE) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     client.findProxy = (uri) {
    //       return "PROXY $PROXY_IP:$PROXY_PORT";
    //     };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  /// 初始化公共属性
  /// [baseUrl] 地址前缀
  /// [interceptors] 基础拦截器
  void init({
    String? baseUrl,
    int connectTimeout = 15000,
    int receiveTimeout = 15000,
    Map<String, String>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers ?? const {},
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 关闭所有 pending dio
  void cancelRequests() {
    pendingRequest.map((token) => token!.cancel('dio cancel'));
  }

  /// 获取cancelToken , 根据传入的参数查看使用者是否有动态传入cancel，没有就生成一个
  CancelToken createDioCancelToken(CancelToken? cancelToken) {
    CancelToken token = cancelToken ?? CancelToken();
    pendingRequest.add(token);
    return token;
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = !cacheEnable,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(
      extra: {
        "refresh": refresh,
        "noCache": noCache,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      },
    );
    Response response;
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);
    return response.data;
  }

  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    var response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);
    return response.data;
  }

  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    var response = await dio.put(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);
    return response.data;
  }

  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);
    return response.data;
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);
    return response.data;
  }
}
