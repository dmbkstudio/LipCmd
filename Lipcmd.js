/// <reference path="C:/Users/Administrator/Documents/WORKDIR/HelperLib/src/index.d.ts" />

// Plugin variables
let pluginPath = "./plugins/Lipcmd/";
let binaryPath = pluginPath + "bin/";
let tmpPath = pluginPath + "tmp/";
let lip = binaryPath + "lip.exe";
let busybox = binaryPath + "busybox.exe" + " ";
let wget = busybox + "wget";
let unzip = busybox + "unzip";
let curl = busybox + "curl";
let bash = busybox + "bash";

// Create folders
if (file.exists(tmpPath)) {
} else {
  file.createDir(pluginPath + "tmp");
}
if (file.exists(binaryPath)) {
} else {
  file.createDir(pluginPath + "bin");
}

// Register plugin
const pluginName = "Lipcmd";
const pluginIntroduction = "A general package installer";
const pluginVersion = [0, 0, 1];
const otherInformation = {
  Author: "DiamondBlock Studio",
  License: "GPL-3.0 license",
  Github: "https://github.com/dmbkstutio/Lipcmd",
};
ll.registerPlugin(
  pluginName,
  pluginIntroduction,
  pluginVersion,
  otherInformation
);

// Initalize i18n configuration
const pluginConfigFile = {
  i18nLanguage: "zh_CN",
  lipVersion: "v0.20.1",
  lipRepo: "https://github.com/lippkg/lip",
  lipGithubProxy: "https://github.bibk.top",
  githubProxy: "https://mirror.ghproxy.com/",
  goProxy: "https://goproxy.cn",
};
let pluginConfig = new JsonConfigFile(
  pluginPath + "config/lipcmd.json",
  JSON.stringify(pluginConfigFile)
);

const i18nLangFile = {
  localeName: {
    src: "translation",
  },
  zh_CN: {
    busyboxInstalled: "Busybox 运行库已安装!开始加载插件!",
    busyboxDownloaded: "Busybox 运行库未安装!已下载完成!",
    loadedInfo: "Lipcmd 已成功加载！",
    lipNotExists: "Lip 二进制不存在，正在下载……",
    lipDownloadSucceed: "Lip 下载成功! 正在解压文件……",
    lipDownloadFailed: "Lip 下载失败! 请重启服务器并且再次尝试!",
    lipInitialization: "Lip 已安装，正在进行初始化……",
    lipInitializationFailed: "Lip 初始化失败，请检查你的配置文件……",
    lipInitializationSucceed: "Lip 初始化已完成！",
    lipUnpackSucceed: "Lip 解压完成！",
    lipUnpackFailed: "Lip 解压失败，请再次尝试！",
    metadataDownload: "正在下载metadata…",
    lipCmdLoaded: "LipCmd 已成功加载! 使用方法: /lip --help",
  },
  en: {
    busyboxInstalled: "Busybox runtime has been installed!",
    busyboxDownloaded:
      "Busybox runtine has not installed! Downloaded successfully!",
    loadedInfo: "Lipcmd has been loaded successfully!",
    lipNotExists: "Lip binary file does not exists, downloading…",
    lipDownloadSucceed: "Lip downloaded successfully! Unpacking...",
    lipDownloadFailed:
      "Lip download failed! Please restart server and try again!",
    lipInitialization: "Lip has installed, Initializing...",
    lipInitializationFailed:
      "Lip Initialization failed, please check your configuration file!",
    lipInitializationSucceed: "Lip initialization completed!",
    lipUnpackSucceed: "Lip unpacked!",
    lipUnpackFailed: "Lip unpack failed, please try again!",
    metadataDownload: "Downloading metadata…",
    lipCmdLoaded: "LipCmd loaded successfully! Usage: /lip --help",
  },
};
let i18nLangConfig = new JsonConfigFile(
  pluginPath + "i18n/translation.json",
  JSON.stringify(i18nLangFile)
);

const i18nLocaleName = pluginConfig.get("i18nLanguage");
i18n.load(pluginPath + "i18n/translation.json", i18nLocaleName);

// Plugin initalization
mc.listen("onServerStarted", () => {
  if (file.exists(binaryPath + "busybox.exe")) {
    log(i18n.get("busyboxInstalled"));
  } else {
    log(i18n.get("busyboxDownloaded"));
  }
  log(i18n.get("loadedInfo"));
  if (file.exists(lip)) {
    const lipGithubProxy = pluginConfig.get("lipGithubProxy");
    system.newProcess(
      lip + " config " + " GitHubMirrorURL " + lipGithubProxy,
      (_lipInitGithubExitcode, _lipInitGithubOutput) => {}
    );
    const goProxy = pluginConfig.get("goProxy");
    system.newProcess(
      lip + " config " + " GoModuleProxyURL " + goProxy,
      (lipInitGoproxyExitcode, _lipInitGoproxyOutput) => {
        system.newProcess(
          lip + " config ",
          (_lipConfigViewExitCode, lipConfigViewOutput) => {
            log(" " + "\n" + lipConfigViewOutput);
            log(i18n.get("metadataDownload"));
            const githubProxy = pluginConfig.get("githubProxy");
            const metadataFetchUrl =
              githubProxy +
              "https://raw.githubusercontent.com/dmbkstudio/LipCmd/main/script/fetchmetadata.sh";
            system.newProcess(
              wget + " -qO " + tmpPath + "fetchmetadata.sh " + metadataFetchUrl,
              (_metaFetchExitCode, _metadataFetchOutput) => {
                system.newProcess(
                  bash + " " + tmpPath + "fetchmetadata.sh",
                  (_runFetchExitCode, _runFetchOutput) => {
                    file.delete("./plugins/Lipcmd/tmp/fetchmetadata.sh");
                  }
                );
              }
            );
            log(i18n.get("lipCmdLoaded"));
          }
        );
        if (lipInitGoproxyExitcode == 0) {
          log(i18n.get("lipInitializationSucceed"));
        } else {
          log(i18n.get("lipInitializationFailed"));
        }
      }
    );
  } else {
    log(i18n.get("lipNotExists"));
    const lipDownloadUrl =
      pluginConfig.get("githubProxy") +
      pluginConfig.get("lipRepo") +
      "/releases/download/" +
      pluginConfig.get("lipVersion") +
      "/lip-windows-amd64.zip";
    system.newProcess(
      wget + " -O " + tmpPath + "lip-windows-amd64.zip " + lipDownloadUrl,
      (lipDownloadExitCode, lipDownloadOutput) => {
        log(lipDownloadOutput);
        if (lipDownloadExitCode == 0) {
          log(i18n.get("lipDownloadSucceed"));
          system.newProcess(
            unzip +
              " " +
              tmpPath +
              "lip-windows-amd64.zip" +
              " -d " +
              binaryPath,
            (lipUnpackExitCode, lipUnpackOutput) => {
              log(lipUnpackOutput);
              if (lipUnpackExitCode == 0) {
                log(i18n.get("lipUnpackSucceed"));
                file.delete(tmpPath + "lip-windows-amd64.zip");
                file.delete(binaryPath + "CHANGELOG.md");
                file.delete(binaryPath + "LICENSE");
                file.delete(binaryPath + "README.md");
              } else {
                log(i18n.get("lipUnpackFailed"));
              }
            }
          );
        } else {
          log(i18n.get("lipDownloadFailed"));
        }
      }
    );
  }
});

// Register Console Cmd
mc.regConsoleCmd("lip", "LipCmd", (args) => {
  system.newProcess(
    lip + " " + args[0],
    (_lipInstallExiteCode, lipInstallOutput) => {
      fastLog("\n" + lipInstallOutput);
    }
  );
});

mc.regConsoleCmd("lip install", "LipCmd", (args) => {
  system.newProcess(
    lip + " " + "install " + args[0] + " " + args[1],
    (_lipInstallExiteCode, lipInstallOutput) => {
      fastLog("\n" + lipInstallOutput);
    }
  );
});

mc.regConsoleCmd("lip uninstall", "LipCmd", (args) => {
  system.newProcess(
    lip + " " + "uninstall " + args[0] + " " + args[1],
    (_lipUnInstallExiteCode, lipUnInstallOutput) => {
      fastLog("\n" + lipUnInstallOutput);
    }
  );
});

mc.regConsoleCmd("lip show", "LipCmd", (args) => {
  system.newProcess(
    lip + " " + "show " + args[0],
    (_lipInstallExiteCode, lipInstallOutput) => {
      fastLog("\n" + lipInstallOutput);
    }
  );
});

mc.regConsoleCmd("lip list", "LipCmd", (_args) => {
  system.newProcess(
    lip + " " + "list ",
    (_lipInstallExiteCode, lipInstallOutput) => {
      fastLog("\n" + lipInstallOutput);
    }
  );
});

mc.regConsoleCmd("lip cache", "LipCmd", (args) => {
  system.newProcess(
    lip + " " + "cache " + args[0],
    (_lipInstallExiteCode, lipInstallOutput) => {
      fastLog("\n" + lipInstallOutput);
    }
  );
});
