import { EggAppConfig, PowerPartial } from "egg";

export default () => {
  const config: PowerPartial<EggAppConfig> = {};

  // zk
  // config.rpc = {
  //   registry: {
  //     address: "127.0.0.1:2181",
  //   },
  //   client: {
  //     responseTimeout: 3000,
  //   },
  // };

  return config;
};
