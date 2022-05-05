import { EggAppConfig, EggAppInfo, PowerPartial } from "egg";

export default (appInfo: EggAppInfo) => {
  const config = {} as PowerPartial<EggAppConfig>;

  // override config from framework / plugin
  // use for cookie sign key, should change to your own and keep security
  config.keys = "some-key";

  // add your egg config in here
  // config.middleware = ["requestLog"];

  // zk
  // config.rpc = {
  //   registry: {
  //     address: "zoo2:2181",
  //   },
  //   client: {
  //     responseTimeout: 3000,
  //   },
  // };

  // logstash
  // config.logstash = {
  //   host: "logstash",
  //   port: 15044,
  // };

  config.onerror = {
    errorPageUrl: (err, ctx) => {
      ctx.logger.info(
        JSON.stringify({
          ...ctx.request.headers,
          err,
        })
      );
      return ctx.errorPageUrl || "/500";
    },
  };

  // add your special config in here
  const bizConfig = {
    sourceUrl: `https://github.com/eggjs/examples/tree/master/${appInfo.name}`,
  };

  // the return config will combines to EggAppConfig
  return {
    ...config,
    ...bizConfig,
  };
};
